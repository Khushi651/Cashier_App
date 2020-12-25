//
//  NotificationManager.swift
//  PyramidGold
//
//  Created by MAC on 08/01/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class NotificationManager: NSObject {
    
    static let shared = NotificationManager()
    
    func didOpenNotification(with notificationInfo: [String: Any]) {
        guard let orderType = notificationInfo["type"] as? String else {return}
        switch orderType {
            
        case "HomeDelivery":
            guard let isAdminNotification = notificationInfo["adminNotification"] as?  Bool else{return}
            if isAdminNotification {
                loadHomeVC()
            }else{
                guard let title = notificationInfo["title"] as? String else {return}
                guard let orderId = notificationInfo["typeId"] as? String else {return}
                if title == "Order Delivered"{
                    loadRatingVC(orderId: orderId, orderType: orderType)
                }else{
                    loadLiveOrderVC()
                }
            }
            break
        case "StealDeal":
            guard let isAdminNotification = notificationInfo["adminNotification"] as?  Bool else{return}
            if isAdminNotification {
                loadHomeVC()
            }else{
                guard let title = notificationInfo["title"] as? String else {return}
                guard let orderId = notificationInfo["typeId"] as? String else {return}
                if title == "Order Served"{
                    loadRatingVC(orderId: orderId, orderType: orderType)
                }else{
                    loadStealDealLiveOrderVC()
                }
            }
            break
        case "TakeAway":
            guard let isAdminNotification = notificationInfo["adminNotification"] as? Bool else {return}
            if isAdminNotification {
                loadHomeVC()
            }else{
                guard let title = notificationInfo["title"] as? String else {return}
                guard let orderId = notificationInfo["typeId"] as? String else {return}
                if title == "Order Picked Up"{
                    loadRatingVC(orderId: orderId, orderType: orderType)
                }else{
                    loadLiveOrderVC()
                }
            }
            break
        case "DineIn":
            guard let isAdminNotification = notificationInfo["adminNotification"] as? Bool else {return}
            if isAdminNotification {
                loadHomeVC()
            }else{
                guard let title = notificationInfo["title"] as? String else {return}
                guard let orderId = notificationInfo["typeId"] as? String else {return}
                if title == "Order Served"{
                    loadRatingVC(orderId: orderId, orderType: orderType)
                }else{
                    loadLiveOrderVC()
                }
            }
        case "Event":
            loadHomeVC()
            break
        case "ScratchCard" :
            loadOfferVC();
            break
            
        default:
            Utility.loadRevealSideMenuVC()
            break
        }
    }
    
    func didReceiveNotification(with notificationInfo: [String: Any]) {
        NotificationCenter.default.post(name: Notification.Name.DefaultNotification, object: nil, userInfo: notificationInfo)
    }
    
    func loadLiveOrderVC() {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let revealVC = storyboard.instantiateViewController(withIdentifier: String.className(SWRevealViewController.self) ) as! SWRevealViewController
        AppDelegate.shared.rootViewController = revealVC
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            if let navVC = revealVC.frontViewController as? UINavigationController{
                navVC.pushViewController(LiveOrderSwipeMenuVC.getObject(), animated: false)
            }
        }
    }
    
    func loadStealDealLiveOrderVC() {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let revealVC = storyboard.instantiateViewController(withIdentifier: String.className(SWRevealViewController.self) ) as! SWRevealViewController
        AppDelegate.shared.rootViewController = revealVC
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            if let navVC = revealVC.frontViewController as? UINavigationController{
                let liveOrderSwipeMenuVC = LiveOrderSwipeMenuVC.getObject()
                liveOrderSwipeMenuVC.isOpenStealDealOrder = true
                navVC.pushViewController(liveOrderSwipeMenuVC, animated: false)
            }
        }
    }
    
    func loadRatingVC(orderId : String, orderType : String) {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let revealVC = storyboard.instantiateViewController(withIdentifier: String.className(SWRevealViewController.self) ) as! SWRevealViewController
        AppDelegate.shared.rootViewController = revealVC
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            if let navVC = revealVC.frontViewController as? UINavigationController{
                let ratingVC = RatingVC.getObject()
                ratingVC.orderId = orderId
                ratingVC.orderType = orderType
                navVC.pushViewController(ratingVC, animated: false)
            }
        }
    }
    
    func loadEventSwipeMenuVC() {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let revealVC = storyboard.instantiateViewController(withIdentifier: String.className(SWRevealViewController.self) ) as! SWRevealViewController
        AppDelegate.shared.rootViewController = revealVC
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            if let navVC = revealVC.frontViewController as? UINavigationController{
                navVC.pushViewController(EventsSwipeMenuVC.getObject(), animated: false)
            }
        }
    }
    
    
    func loadScanDineInVC(){
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let revealVC = storyboard.instantiateViewController(withIdentifier: String.className(SWRevealViewController.self) ) as! SWRevealViewController
        AppDelegate.shared.rootViewController = revealVC
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            if let navVC = revealVC.frontViewController as? UINavigationController{
                navVC.pushViewController(ScanNOrderVC.getObject(), animated: false)
            }
        }
    }
    
    func loadSavedDeliveryAddress() {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let revealVC = storyboard.instantiateViewController(withIdentifier: String.className(SWRevealViewController.self) ) as! SWRevealViewController
        AppDelegate.shared.rootViewController = revealVC
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            if let navVC = revealVC.frontViewController as? UINavigationController{
                
                Singleton.shared.orderType = "HomeDelivery"
                let savedDeliveryAddressVC = SavedDeliveryAddressVC.getObject()
                savedDeliveryAddressVC.didSelectDeliveryAddress = { (deliveryAddressModel) in
                    DispatchQueue.main.async {
                        let restaurantListVC = RestaurantListVC.getObject()
                        restaurantListVC.fromWhere = Singleton.shared.orderType
                        restaurantListVC.addressId = deliveryAddressModel.recordId
                        restaurantListVC.deliveryAddressLat = deliveryAddressModel.latitude
                        restaurantListVC.deliveryAddressLat = deliveryAddressModel.longitude
                        navVC.pushViewController(restaurantListVC, animated: false)
                    }
                }
                
                navVC.pushViewController(savedDeliveryAddressVC, animated: false)
            }
        }
    }
    
    func loadRestaurantListVC() {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let revealVC = storyboard.instantiateViewController(withIdentifier: String.className(SWRevealViewController.self) ) as! SWRevealViewController
        AppDelegate.shared.rootViewController = revealVC
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            if let navVC = revealVC.frontViewController as? UINavigationController{
                Singleton.shared.orderType = "TakeAway"
                let restaurantListVC = RestaurantListVC.getObject()
                restaurantListVC.fromWhere = Singleton.shared.orderType
                navVC.pushViewController(restaurantListVC, animated: false)
            }
        }
    }
    
    func loadHomeVC() {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let revealVC = storyboard.instantiateViewController(withIdentifier: String.className(SWRevealViewController.self) ) as! SWRevealViewController
        AppDelegate.shared.rootViewController = revealVC
    }
    
    func loadOfferVC() {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let revealVC = storyboard.instantiateViewController(withIdentifier: String.className(SWRevealViewController.self) ) as! SWRevealViewController
        AppDelegate.shared.rootViewController = revealVC
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            if let navVC = revealVC.frontViewController as? UINavigationController{
                Utility.FromNotification = true
                navVC.pushViewController(RewardsVC.getObject(), animated: false)
            }}
    }
}
