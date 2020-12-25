//
//  SessionManager.swift
//  PyramidGold
//
//  Created by MAC on 25/10/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import Foundation

class SessionManager : NSObject{
    
    //MARK:-  ****************************** Login model ******************************
    static func setLoginModel(loginModel object:LoginModel)
    {
        let objectData = NSKeyedArchiver.archivedData(withRootObject: object)
        UserDefaults.standard.set(objectData, forKey: "LoginModel")
        UserDefaults.standard.synchronize()
    }
    
    static func getLoginModel() -> LoginModel?
    {
        
        guard let encodedobject:Data = UserDefaults.standard.object(forKey: "LoginModel") as? Data  else{return nil}
        
        let object: LoginModel? = NSKeyedUnarchiver.unarchiveObject(with: encodedobject) as? LoginModel
        
        if let model=object
        {
            return model
        }
        
        return nil
        
    }
    
    static func removeLoginModel(){
        UserDefaults.standard.removeObject(forKey: "LoginModel")
    }
    
    
    //MARK:-  ****************************** Is User already logged in  ******************************
    static func isAlreadyLoggedIn()->Bool
    {
        return UserDefaults.standard.bool(forKey: "is_Logged_In")
    }
    
    static func setIsUserLoggedIn(status:Bool)
    {
        UserDefaults.standard.set(status, forKey: "is_Logged_In")
    }
    
    static func removeLoggedInStatus(){
        UserDefaults.standard.removeObject(forKey: "is_Logged_In")
    }
    
    //MARK:-  ****************************** Is User already updated profile  ******************************
    static func isAlreadyProfileUpdated()->Bool
    {
        return UserDefaults.standard.bool(forKey: "is_Profile_Updated")
    }
    
    static func setIsProfileUpdated(status:Bool)
    {
        UserDefaults.standard.set(status, forKey: "is_Profile_Updated")
    }
    
    static func removeProfileUpdateStatus(){
        UserDefaults.standard.removeObject(forKey: "is_Profile_Updated")
    }
    
    
    //MARK:- FIREBASE REGISTERATION TOKEN
    
    static func getFCMToken() -> String?{
        return UserDefaults.standard.string(forKey: "FCMToken")
    }
    
    static func setFCMToken(fcmToken:String)
    {
        UserDefaults.standard.set(fcmToken, forKey: "FCMToken")
    }
    
    static func removeFCMToken(){
        UserDefaults.standard.removeObject(forKey: "FCMToken")
    }
    
    //MARK:- OTHERS
    // save locally ordertype to check type of saved cart data
    static func getSavedCartType() -> String?{
        return UserDefaults.standard.string(forKey: "SavedCartType")
    }
    
    static func setSavedCartType(cartType:String)
    {
        UserDefaults.standard.set(cartType, forKey: "SavedCartType")
    }
    
    static func removeSavedCartType(){
        UserDefaults.standard.removeObject(forKey: "SavedCartType")
    }
    
    static func getRestaurantDineInModel() -> RestaurantDineInModel?{
        guard let encodedobject:Data = UserDefaults.standard.object(forKey: "RestaurantDineInModel") as? Data  else{return nil}
        let object = NSKeyedUnarchiver.unarchiveObject(with: encodedobject) as? RestaurantDineInModel
        return object
    }
    
    static func setRestaurantDineInModel(model:RestaurantDineInModel)
    {
        let objectData = NSKeyedArchiver.archivedData(withRootObject: model)
        UserDefaults.standard.set(objectData, forKey: "RestaurantDineInModel")
        UserDefaults.standard.synchronize()
    }
    
    static func removeRestaurantDineInModel(){
        UserDefaults.standard.removeObject(forKey: "RestaurantDineInModel")
    }
    
    static func getScanedAtTimeStamp() -> Int64?{
        guard let encodedobject:Data = UserDefaults.standard.object(forKey: "ScanedAtTimeStamp") as? Data  else{return nil}
        let object = NSKeyedUnarchiver.unarchiveObject(with: encodedobject) as? Int64
        return object
    }
    
    static func setScanedAtTimeStamp(timeStamp:Int64)
    {
        let objectData = NSKeyedArchiver.archivedData(withRootObject: timeStamp)
        UserDefaults.standard.set(objectData, forKey: "ScanedAtTimeStamp")
        UserDefaults.standard.synchronize()
    }
    
    static func removeScanedAtTimeStamp(){
        UserDefaults.standard.removeObject(forKey: "ScanedAtTimeStamp")
    }
    
    static func getStealDealCartSavedAtTimeStamp() -> Int64?{
        guard let encodedobject:Data = UserDefaults.standard.object(forKey: "StealDealCartSavedAtTimeStamp") as? Data  else{return nil}
        let object = NSKeyedUnarchiver.unarchiveObject(with: encodedobject) as? Int64
        return object
    }
    
    static func setStealDealCartSavedAtTimeStamp(timeStamp:Int64)
    {
        let objectData = NSKeyedArchiver.archivedData(withRootObject: timeStamp)
        UserDefaults.standard.set(objectData, forKey: "StealDealCartSavedAtTimeStamp")
        UserDefaults.standard.synchronize()
    }
    
    static func removeStealDealCartSavedAtTimeStamp(){
        UserDefaults.standard.removeObject(forKey: "StealDealCartSavedAtTimeStamp")
    }
    
    static func getLastNotificationInfo() -> [String: Any]?{
        guard let encodedobject:Data = UserDefaults.standard.object(forKey: "LastNotificationInfo") as? Data  else{return nil}
        let object = NSKeyedUnarchiver.unarchiveObject(with: encodedobject) as? [String: Any]
        return object
    }
    
    static func setLastNotificationInfo(info:[String: Any])
    {
        let objectData = NSKeyedArchiver.archivedData(withRootObject: info)
        UserDefaults.standard.set(objectData, forKey: "LastNotificationInfo")
        UserDefaults.standard.synchronize()
    }
    
    static func removeLastNotificationInfo(){
        UserDefaults.standard.removeObject(forKey: "LastNotificationInfo")
    }
    
    //MARK:-  ****************************** Delivery Offer model ******************************
    static func setDeliveryOfferModel(loginModel object:DeliveryOffer)
    {
        let objectData = NSKeyedArchiver.archivedData(withRootObject: object)
        UserDefaults.standard.set(objectData, forKey: "deliveryOffer")
        UserDefaults.standard.synchronize()
    }
    
    static func getDeliveryOfferModel() -> DeliveryOffer?
    {
        guard let encodedobject:Data = UserDefaults.standard.object(forKey: "deliveryOffer") as? Data  else{return nil}
        
        let object: DeliveryOffer? = NSKeyedUnarchiver.unarchiveObject(with: encodedobject) as? DeliveryOffer
        
        if let model=object
        {
            return model
        }
        
        return nil
        
    }
    
    static func removeDeliveryOfferModel(){
        UserDefaults.standard.removeObject(forKey: "deliveryOffer")
    }
    
    static func getdeliveryOfferSavedAtTimeStamp() -> Int64?{
        guard let encodedobject:Data = UserDefaults.standard.object(forKey: "deliveryOfferTimeStamp") as? Data  else{return nil}
        let object = NSKeyedUnarchiver.unarchiveObject(with: encodedobject) as? Int64
        return object
    }
    
    static func setdeliveryOfferSavedAtTimeStamp(timeStamp:Int64)
    {
        let objectData = NSKeyedArchiver.archivedData(withRootObject: timeStamp)
        UserDefaults.standard.set(objectData, forKey: "deliveryOfferTimeStamp")
        UserDefaults.standard.synchronize()
    }
    
    static func removedeliveryOfferSavedAtTimeStamp(){
        UserDefaults.standard.removeObject(forKey: "deliveryOfferTimeStamp")
    }
    
    static func setAvailbleCouponModel(loginModel object:AvailableCouponCellModel)
    {
        let objectData = NSKeyedArchiver.archivedData(withRootObject: object)
        UserDefaults.standard.set(objectData, forKey: "availbleCoupon")
        UserDefaults.standard.synchronize()
    }
    
    static func getAvailbleCouponModel() -> AvailableCouponCellModel?
    {
        guard let encodedobject:Data = UserDefaults.standard.object(forKey: "availbleCoupon") as? Data  else{return nil}
        
        let object: AvailableCouponCellModel? = NSKeyedUnarchiver.unarchiveObject(with: encodedobject) as? AvailableCouponCellModel
        
        if let model=object
        {
            return model
        }
         return nil
        
    }
    
    static func removeAvailbleCouponModel(){
        UserDefaults.standard.removeObject(forKey: "availbleCoupon")
    }
    
}
