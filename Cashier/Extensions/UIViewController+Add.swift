//
//  UIViewController.swift
//  ConfigureApp
//
//  Created by MAC on 30/09/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

extension UIViewController{
    
    var currencySymbol:String{
        get{
            return "₹"
        }
    }
    
   @objc func didChangeIndexSwipeMenuView() {
        
    }
    
    //MARK:- SHOW ALERT METHODS
    func showAlert(title:String = Constant.APP_NAME,message:String)  {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.modalPresentationStyle = .overCurrentContext
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showAlert(title:String = Constant.APP_NAME,message:String,isEnabled : Bool = true,okTitle:String = "Ok",okAction:@escaping (UIAlertAction) -> Void)  {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.modalPresentationStyle = .overCurrentContext
        let okAction = UIAlertAction(title: okTitle, style: .default, handler: okAction)
        okAction.isEnabled = isEnabled
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showAlert(title:String = Constant.APP_NAME,message:String,okTitle: String = "Ok",cancelTitle: String = "Cancel",okAction:@escaping (UIAlertAction) -> Void,cancelAction:@escaping (UIAlertAction) -> Void)  {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.modalPresentationStyle = .overCurrentContext
        let okAction = UIAlertAction(title: okTitle, style: .default, handler: okAction)
        let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelAction)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showAlertWithTextField(message:String,oktitle:String,okaction:@escaping ((_ input:String)->Void),notitle:String,isSecureTxtEntry: Bool = false,noaction:@escaping (()->Void))
    {
        let systemVersion : NSString  = UIDevice.current.systemVersion as NSString
        if systemVersion.floatValue >= 8.0
        {
            let alert=UIAlertController(title: nil, message: message, preferredStyle: .alert)
            alert.modalPresentationStyle = .overCurrentContext
            alert.addTextField(configurationHandler: { (txtField) in
                txtField.placeholder = message
                txtField.isSecureTextEntry = isSecureTxtEntry
            })
            
            let ok=UIAlertAction(title: oktitle, style: .default) { (action) in
                
                okaction(alert.textFields![0].text!)
            }
            
            let no=UIAlertAction(title: notitle, style: .default) { (action) in
                noaction()
            }
            alert.addAction(no)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }
    }
    func showAlertWithTextField( message:String,tfText:String,oktitle:String,okaction:@escaping ((_ input:String)->Void),notitle:String,noaction:@escaping (()->Void))
    {
        let systemVersion : NSString  = UIDevice.current.systemVersion as NSString
        if systemVersion.floatValue >= 8.0
        {
            let alert=UIAlertController(title: nil, message: message, preferredStyle: .alert)
            alert.modalPresentationStyle = .overCurrentContext
            alert.addTextField(configurationHandler: { (txtField) in
                txtField.placeholder = message
                txtField.text = tfText
            })
            
            let ok=UIAlertAction(title: oktitle, style: .default) { (action) in
                
                okaction(alert.textFields![0].text!)
            }
            
            let no=UIAlertAction(title: notitle, style: .default) { (action) in
                noaction()
            }
            alert.addAction(no)
            alert.addAction(ok)

            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    func showActionSheet(message:String,preferredStyle:UIAlertController.Style,arrActionTitles:[String],actionDidSelect:@escaping ((_ actionTitle:String,_ index: Int)->Void),cancelTitle:String,cancelAction:@escaping (()->Void))
    {
        let systemVersion : NSString  = UIDevice.current.systemVersion as NSString
        if systemVersion.floatValue >= 8.0
        {
            let alert=UIAlertController(title: nil, message: message, preferredStyle: preferredStyle)
            alert.modalPresentationStyle = .overCurrentContext
            for i in 0..<arrActionTitles.count{
                let alertAction = UIAlertAction(title: arrActionTitles[i], style: .default) { (action) in
                    actionDidSelect(arrActionTitles[i], i)
                }
                alert.addAction(alertAction)
            }

            let cancel=UIAlertAction(title: cancelTitle, style: .destructive) { (action) in
                cancelAction()
            }

            alert.addAction(cancel)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    //MARK:- UTILITY METHODS
    
    func openSettingApp() {
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
    
}

extension UIViewController : MFMailComposeViewControllerDelegate {
    
    //MARK:- Email Invite
    func openMailComposer(toRecipent emailId: String? = "", subject: String, message: String? = "") {
        
        let mailCompose = MFMailComposeViewController()
        mailCompose.modalPresentationStyle = .overCurrentContext
        guard MFMailComposeViewController.canSendMail() else {
            return
        }
        mailCompose.mailComposeDelegate = self
        mailCompose.setSubject(subject)
        mailCompose.setMessageBody(message ?? "", isHTML: true)
        if let id = emailId {
            mailCompose.setToRecipients([id])
        }
        present(mailCompose, animated: true, completion: {})
    }
    
    
    public func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
            
        case .sent:
            showAlert(message: "Mail sent successfully")
        case .saved:
            NSLog("You saved a draft of this email")
        case .cancelled:
            NSLog("You cancelled sending this email.")
        case .failed:
            showAlert(message: "Mail failed: \([error!.localizedDescription])")
        @unknown default:
            fatalError("Unknown case")
        }
        
        dismiss(animated: true, completion: {})
    }
}

extension UIViewController{
    
    
    
}
