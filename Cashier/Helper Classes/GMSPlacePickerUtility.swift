//
//  GMSPlacePickerUtility.swift
//  PyramidGold
//
//  Created by MAC on 03/12/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import Foundation
import UIKit
import GooglePlaces

class GMSPlacePickerUtility: NSObject,GMSAutocompleteViewControllerDelegate{
    
    //MARK:- Local class property
    static var placePickerUtility : GMSPlacePickerUtility!
    var gmsPlacePickerController : GMSAutocompleteViewController!
    
    //MARK:- Local variable for hold completion block
    private var pickPlaceCompletionHandler: (CLLocation?,String?, NSError?)-> Void = { location, formattedAddress ,error  in }
    
    //MARK:- Singleton object
    /*
     *    Below method is used to access singlton object of placePickerUtility.
     */
    class func sharedInstanse() -> GMSPlacePickerUtility {
        if placePickerUtility == nil {
            placePickerUtility = GMSPlacePickerUtility()
        }
        return placePickerUtility
    }
    
    //MARK:- SHOW PICKER AND SEARCH PLACES
    func pickPlace(completionHandler:  @escaping (_ image: CLLocation?,_ imageURL:String?, _ error: NSError?) -> ()) {
        pickPlaceCompletionHandler = completionHandler
        gmsPlacePickerController  = GMSAutocompleteViewController()
        gmsPlacePickerController.modalPresentationStyle = .overCurrentContext
        gmsPlacePickerController.delegate  = self
        DispatchQueue.main.async(execute: {
            guard  let rootViewController=(UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController else {
                return
            }
            rootViewController.present(self.gmsPlacePickerController, animated: true, completion: nil)
        })
    }
    
    //MARK:- DELEGATE METHODS
    
    public func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        
        print("Place name: \(String(format: "%@", place.name!))")
        print("Place address: \(String(format: "%@", place.formattedAddress!))")
        let location = CLLocation(latitude: place.coordinate.latitude, longitude: place.coordinate.longitude)
        let formattedAddresses = place.formattedAddress
        pickPlaceCompletionHandler(location, formattedAddresses , nil)
        gmsPlacePickerController.dismiss(animated: true, completion: nil)
    }
    
    public func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        print("error in map picker:- ",error.localizedDescription)
        pickPlaceCompletionHandler(nil, nil , NSError())
        gmsPlacePickerController.dismiss(animated: true, completion: nil)
    }
    
    public func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        print("place picker cancelled by user")
        pickPlaceCompletionHandler(nil, nil , NSError())
        gmsPlacePickerController.dismiss(animated: true, completion: nil)
    }
}
