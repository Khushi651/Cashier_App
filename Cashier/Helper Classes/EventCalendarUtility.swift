//
//  EventCalendarUtility.swift
//  PyramidGold
//
//  Created by MAC on 10/12/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import Foundation
import UIKit
import EventKit
import EventKitUI

class Event: NSObject {
    var name: String!
    var dateStart: Date!
    var dateEnd: Date!
}

class EventCalendarUtility: NSObject, EKEventEditViewDelegate{
    
    //MARK:- Local class property
    static var eventCalendarUtility : EventCalendarUtility!
    var eventStore : EKEventStore!
    
    //MARK:- Local variable for hold completion block
    private var addEventCompletionHandler: (String?)-> Void = { isSuccess  in }
    
    //MARK:- Singleton object
    /*
     *    Below method is used to access singlton object of placePickerUtility.
     */
    class func sharedInstanse() -> EventCalendarUtility {
        if eventCalendarUtility == nil {
            eventCalendarUtility = EventCalendarUtility()
        }
        return eventCalendarUtility
    }
    
    
    //MARK:- Request access to the Calendar
    
    private func requestAccess(completion: @escaping (Bool)->()) {
        eventStore.requestAccess(to: EKEntityType.event) { (accessGranted, error) in
            if(error == nil){
                completion(true)
            }else{
                completion(false)
            }
        }
    }
    
    //MARK:- Get Calendar auth status
    
    private func getAuthorizationStatus() -> EKAuthorizationStatus {
        return EKEventStore.authorizationStatus(for: EKEntityType.event)
    }
    
    // Generate an event which will be then added to the calendar
    
    private func generateEvent(event: Event) -> EKEvent {
        let newEvent = EKEvent(eventStore: eventStore)
        newEvent.calendar = eventStore.defaultCalendarForNewEvents
        newEvent.title = event.name
        newEvent.startDate = event.dateStart
        newEvent.endDate = event.dateEnd
        // Set default alarm minutes before event
        let alarm = EKAlarm.init(absoluteDate: Date.init(timeInterval: -3600, since: event.dateStart))
        newEvent.addAlarm(alarm)
        return newEvent
    }
    

    //MARK:- Show event kit ui to add event to calendar
    
    func presentCalendarModalToAddEvent(event: Event, completion : @escaping (String?)->()) {
        eventStore = EKEventStore()
        addEventCompletionHandler = completion
        let authStatus = getAuthorizationStatus()
        switch authStatus {
        case .authorized:
            presentEventCalendarDetailModal(event: event)
        case .notDetermined:
            //Auth is not determined
            //We should request access to the calendar
            requestAccess { (isAuthorized) in
                if isAuthorized {
                    self.presentEventCalendarDetailModal(event: event)
                } else {
                    // Auth denied, we should display a popup
                    self.addEventCompletionHandler("Denied")
                }
            }
        case .denied, .restricted:
            // Auth denied or restricted, we should display a popup
            addEventCompletionHandler("Denied")
        }
    }
    
    // Present edit event calendar modal
    
    func presentEventCalendarDetailModal(event: Event) {
        let event = generateEvent(event: event)
        let eventModalVC = EKEventEditViewController()
        eventModalVC.modalPresentationStyle = .overCurrentContext
        eventModalVC.event = event
        eventModalVC.eventStore = eventStore
        eventModalVC.editViewDelegate = self
        DispatchQueue.main.async(execute: {
            guard  let rootViewController=(UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController else {
                return
            }
            rootViewController.present(eventModalVC, animated: true, completion: nil)
        })
    }
    
    func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
        controller.dismiss(animated: true, completion: nil)
        if(action == .saved){
            addEventCompletionHandler("Saved")
        }else{
            addEventCompletionHandler("Canceled")
        }
    }
    
}
