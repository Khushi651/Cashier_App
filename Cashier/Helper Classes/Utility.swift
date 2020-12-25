//
//  Utility.swift
//  ConfigureApp
//
//  Created by MAC on 30/09/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import Foundation
import UIKit
import AVKit
import AVFoundation
import MobileCoreServices
import Mobilisten

class Utility: NSObject {
    
    class func logAllAvailableFonts() {
        for familyName in UIFont.familyNames {
            print("------------------------------")
            print("Font Family Name = [\(familyName)]")
            let names = UIFont.fontNames(forFamilyName: familyName)
            print("Font Names = [\(names)]")
        }
    }
    
    static let currenySymbol = "₹"
    static var FromNotification:Bool = Bool()
    
    //MARK:- Play video
    static func play(_ videoUrl:URL,controller:UIViewController)
    {
        let videoURL=videoUrl
        let player = AVPlayer(url: videoURL)
        
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        controller.present(playerViewController, animated: true)
        {
            playerViewController.player!.play()
        }
    }
    
    //MARK:- UTILITY METHODS
    
   static  func openSettingApp() {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        
        if UIApplication.shared.canOpenURL(settingsUrl)
        {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                    NSLog("Settings opened: \(success)") // NSLogs true
                })
            } else {
                // Fallback on earlier versions
                let success = UIApplication.shared.openURL(settingsUrl)
                NSLog("Open \(settingsUrl): \(success)")
            }
        }
        
    }
    
    
    //MARK:- GET THUMBNAIL IMAGE
    static func getThumbnailImage(forUrl url: URL) -> UIImage? {
        let asset: AVAsset = AVAsset(url: url)
        let imageGenerator = AVAssetImageGenerator(asset: asset)
        
        do {
            let thumbnailImage = try imageGenerator.copyCGImage(at: CMTimeMake(value: 1, timescale: 60) , actualTime: nil)
            return UIImage(cgImage: thumbnailImage)
        } catch let error {
            print(error.localizedDescription)
        }
        return nil
    }
    
    //MARK:- GET DOCUMENT PICKER
    static func getDocumentPickerObject(docTypes:[String]=[String(kUTTypePDF),String(kUTTypeItem)])->UIDocumentPickerViewController{
        let importMenu = UIDocumentPickerViewController(documentTypes: docTypes, in: .import)
        importMenu.modalPresentationStyle = .formSheet
        return importMenu
    }
    
    static func loadRevealSideMenuVC()  {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let revealMenuVC = storyboard.instantiateViewController(withIdentifier: String.className(SWRevealViewController.self))
        AppDelegate.shared.rootViewController = revealMenuVC
    }
    
    
    
    static func loadHomeVC(){
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let revealVC = storyboard.instantiateViewController(withIdentifier: String.className(SWRevealViewController.self) ) as! SWRevealViewController
        AppDelegate.shared.rootViewController = revealVC
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            if let navVC = revealVC.frontViewController as? UINavigationController{
                navVC.pushViewController(HomeVC.getObject(), animated: false)
            }
        }
    }
    
    static func loadScanDineInVC(){
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let revealVC = storyboard.instantiateViewController(withIdentifier: String.className(SWRevealViewController.self) ) as! SWRevealViewController
        AppDelegate.shared.rootViewController = revealVC
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            if let navVC = revealVC.frontViewController as? UINavigationController{
                navVC.pushViewController(ScanNOrderVC.getObject(), animated: false)
            }
        }
    }
    
   static func loadCompletionPopUpVC(with title: String) {
        let completionPopUpVC = CompletionPopUpVC.getObject()
        completionPopUpVC.modalPresentationStyle = .overCurrentContext
        completionPopUpVC.modalTransitionStyle = .crossDissolve
        completionPopUpVC.completionTitle = title
        completionPopUpVC.didOkAction = {
            Utility.loadRevealSideMenuVC()
        }
        let rootVC = AppDelegate.shared.rootViewController
        rootVC?.present(completionPopUpVC, animated: true, completion: nil)
    }
    
    static func logOutUser()
    {
        SessionManager.removeLoginModel()
        SessionManager.removeLoggedInStatus()
        SessionManager.removeProfileUpdateStatus()
        ZohoSalesIQ.unregisterVisitor()
        AppDelegate.shared.rootViewController = SplashVC.getObject()
    }
    
    static func showUnauthorizedAccessAlert() {
        let rootVC = AppDelegate.shared.rootViewController
        rootVC?.showAlert(message: "You are not authorised to access. Please login again!!", okAction: { (action) in
            Utility.logOutUser()
        })
    }
    
    static func showAlertWithMsg(with message: String) {
        let rootVC = AppDelegate.shared.rootViewController
        rootVC?.showAlert(message: message, okAction: { (action) in
            exit(0)
        })
    }
    
    static var arrShortMonthsNames : [String]{
        get{
            var arrMonthsNames = [String]()
            for i in 0..<12{
                let dateFormatter = DateFormatter()
                let monthName = dateFormatter.shortMonthSymbols[i]
                arrMonthsNames.append(monthName)
            }
            return arrMonthsNames
        }
    }
    
    static func openGoogleMapsWith(latitude: Double, longtitude: Double){
        if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!)) {            UIApplication.shared.open(URL(string:"comgooglemaps://?saddr=&daddr=\(latitude),\(longtitude)&directionsmode=driving")!, options: [:], completionHandler: nil)
        }
        else {
            print("Can't use comgooglemaps://");
            UIApplication.shared.open(URL.init(string: "https://www.google.co.in/maps/dir/?saddr=&daddr=\(latitude),\(longtitude)&directionsmode=driving")!, options: [:], completionHandler: nil)
        }
    }
    
    static func makePhoneCallWith(mobileNumber: String){
        guard let url = URL(string: "tel://\(mobileNumber)"), UIApplication.shared.canOpenURL(url) else { return }
        if #available(iOS 10, *) {
            UIApplication.shared.open(url)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    static func openAppStore() {
        if let url = URL(string: Constant.APP_STORE_LINK_URL),
            UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url, options: [:]) { (opened) in
                if(opened){
                    print("App Store Opened")
                }
            }
        } else {
            print("Can't Open URL on Simulator")
        }
    }
    
}
