//
//  UIViewController+FBLogin.swift
//  PyramidGold
//
//  Created by MAC on 11/01/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import FBSDKCoreKit
import FBSDKLoginKit


extension UIViewController{
    
    func loginWithFB(didLoggedInCompletion : @escaping (SocialModel) -> ())
    {
        let loginManager = LoginManager()//LoginManager()
        loginManager.logOut()
        loginManager.loginBehavior = LoginBehavior.browser
        
        loginManager.logIn(permissions:  ["public_profile", "email"], from: self) { (loginResult, error) in
            if error == nil{
                if let cancelled = loginResult?.isCancelled , cancelled == true {
                    if let rootVC = AppDelegate.shared.rootViewController {
                        rootVC.showAlert(message: "Cancelled.")
                    }
                }else{
                    self.getFBUserData(didLoggedInCompletion: didLoggedInCompletion)
                }
            }else{
                if let rootVC = AppDelegate.shared.rootViewController {
                    rootVC.showAlert(message: "An error has occcured.")
                }
            }
        }
    }
    /*
    *  Below method is used to get data from facebook.
    */
     func getFBUserData(didLoggedInCompletion : @escaping (SocialModel) -> ())
    {
        let userAccessToken = AccessToken.current?.tokenString
        if(userAccessToken != nil){
            GraphRequest(graphPath: "me", parameters: ["fields": "id, name, picture.type(large), email"]).start(completionHandler: { (connection, result, error)  in
                if (error == nil){
                    self.parseFB_Data(jsonData: result, userAccessToken : userAccessToken! ,didLoggedInCompletion: didLoggedInCompletion)
                }
            })
        }
    }
    /*
    *  Below method is used to parse data from facebook. and check wheter user already registered or not.
    * If user already registered then go to home.
    * Otherwise go to sign up form with user details from fb.
    */
    func parseFB_Data(jsonData: Any?, userAccessToken: String ,didLoggedInCompletion : @escaping (SocialModel) -> ())
    {
        guard let data = jsonData as? [String:Any] else {return}
        
            var email=""
            if let eml = data["email"] as? String
            {
                email=eml
            }
            
            guard let id = data["id"] as? String else{return}
            
            var name=""
            if let nme = data["name"] as? String
            {
                name=nme
            }
        
            var imageUrl=""
            if let dict=data["picture"] as? [String:Any]
            {
                if let inner_data=dict["data"] as? [String:Any]
                {
                    if let image=inner_data["url"] as? String
                    {
                        imageUrl=image
                    }
                }
            }
        
        let model = SocialModel(email: email, userId: id, idToken: "", fullName: name, givenName: "",imageURL:imageUrl, userAccessToken: userAccessToken)
        model.socialLoginType = "Facebook"
        didLoggedInCompletion(model)
    }
    
}
