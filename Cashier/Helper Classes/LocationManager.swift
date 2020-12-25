//
//  LocationManager.swift
//  FontDemo
//
//  Created by MAC on 24/10/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import Alamofire

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    static let shared = LocationManager()
    
    var locationManager: CLLocationManager?
    var lastLocation: CLLocation?
    
    var didUpdateCurrentLocation : ((CLLocation)->())?
    var didWhenInUseAuthorized : (()->())?
    var didFailUpdateCurrentLocation : ((Error)->())?
    var didFailedAuthorized : (()->())?
    override init() {
        super.init()
        locationManager = CLLocationManager()
        guard let locationManager = self.locationManager else {return}
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        
    }
    
    //MARK:- REQUESTING PERMISSION LOCATION
    func requestWhenInUsePermission(){
        guard let locationManager = self.locationManager else {return}
        locationManager.requestWhenInUseAuthorization()
    }
    
    func requestAlwaysUsePermission(){
        guard let locationManager = self.locationManager else {return}
        locationManager.requestAlwaysAuthorization()
    }
    
    //MARK:- UPDATING LOCATION
    func startUpdatingLocation() {
        print("Starting Location Updates")
        self.locationManager?.startUpdatingLocation()
    }
    
    func stopUpdatingLocation() {
        print("Stop Location Updates")
        self.locationManager?.stopUpdatingLocation()
    }
    
    //MARK:- CLLOCATIONMANAGER DELEGATE

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (status == .authorizedWhenInUse) {
           // User has granted autorization to location, get location
           didWhenInUseAuthorized?()
        }else if (status == .denied || status == .restricted){
           didFailedAuthorized?()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        lastLocation = location
        didUpdateCurrentLocation?(location)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error in getting location :- "+error.localizedDescription)
        didFailUpdateCurrentLocation?(error)
    }
    
    func getFormattedAddressFromLatLong(latitude: CLLocationDegrees,longitude:CLLocationDegrees, completion: @escaping (String)->()) {
        
        let geoCodeApiUrl = "https://maps.googleapis.com/maps/api/geocode/json?latlng=\(latitude),\(longitude)&key=\(Constant.GOOGLE_API_KEY)"
        
        Alamofire.request(geoCodeApiUrl, method: .get, parameters: nil,headers: nil).responseJSON { (response) in
            
            switch(response.result) {
                
            case .success(_):
                
                let responseDict = response.result.value as! [String: Any]
                let results = responseDict["results"] as! [[String: Any]]
                guard let formattedAddress = results.first?["formatted_address"] as? String else{return}
                completion(formattedAddress)
                break;
                
            case .failure(let error):
                print(error.localizedDescription)
                break
                
            }
        }
        
    }
    
}
