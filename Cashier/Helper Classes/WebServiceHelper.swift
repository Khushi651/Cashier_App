//
//  WebServiceHelper.swift
//  ConfigureApp
//
//  Created by MAC on 30/09/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import Foundation
import Alamofire
import SystemConfiguration
import SVProgressHUD

class WebServiceHelper : NSObject{
    
    private static var defaultHeaders : [String:String]{
        get{
            var strAuthBase64: String?
            if let loginModel = SessionManager.getLoginModel(), loginModel.mobile != nil, loginModel.secretKey != nil {
                let str = "\(loginModel.mobile!):\(loginModel.secretKey!)"
                strAuthBase64 = str.base64Encoded()
            }
            let headers = [
                "Authorization": (strAuthBase64 != nil) ? "Basic \(strAuthBase64!)" : "",
                "Content-Type":"application/json"
            ]
            return headers
        }
        set{
            self.defaultHeaders = newValue
        }
    }
    
    //MARK:- GET REQUEST
    static func getRequest(apiUrl: String, headers : [String:String] = defaultHeaders, canShowHud : Bool,  completionHandler : @escaping (_ result: ResponseModel)->()) {
        
        print("get request :-  *\(apiUrl)*")
        guard isInternetAvailable()==true else {
            
            guard  let rootViewController=(UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController else {
                return
            }
            DispatchQueue.main.async {
                rootViewController.showAlert(title: Constant.MESSAGE_INTERNET_LOST_TITLE, message: Constant.MESSAGE_INTERNET_LOST) { (action) in
                    Utility.openSettingApp()
                    DispatchQueue.main.asyncAfter(deadline: .now()+1.0) {
                        exit(0)
                    }
                }
            }
            return
        }
        
        if canShowHud{
            DispatchQueue.main.async {
                SVProgressHUD.show()
                SVProgressHUD.setDefaultMaskType(.clear)
            }
        }
        
        Alamofire.request(apiUrl, method: .get, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { response in
                
                if canShowHud{
                    DispatchQueue.main.async {
                        SVProgressHUD.dismiss()
                    }
                }
                
                switch response.result {
                    
                case .success(_):
                    
                    let prettyPrintedResponse = NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue)
                    print(prettyPrintedResponse!)
                    do{
                        let responseDict = try JSONSerialization.jsonObject(with: response.data!, options: JSONSerialization.ReadingOptions(rawValue: String.Encoding.utf8.rawValue)) as! [String:Any]
                        
                        let responseModel = ResponseModel(fromDictionary: responseDict)
                        
                        if let success = responseModel.success, success == false{
                            if(responseModel.errorCode == 409){
                                // unauthorized access
                                Utility.showUnauthorizedAccessAlert()
                            }else{
                                completionHandler(responseModel)
                            }
                        }else{
                            completionHandler(responseModel)
                        }
                        
                    }
                    catch{
                        print("failed to serialize, \(error.localizedDescription)")
                    }
                    
                case .failure(let error):
                    
                    print(error.localizedDescription)
                    guard  let rootViewController=(UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController else {
                        return
                    }
                    rootViewController.view.makeToast(error.localizedDescription)
                    
                }
        }
        
    }
    
    //MARK:- DELETE REQUEST
    static func deleteRequest(apiUrl: String, headers : [String:String] = defaultHeaders, canShowHud : Bool,  completionHandler : @escaping (_ result: ResponseModel)->()) {
        
        print("get request :-  *\(apiUrl)*")
        guard isInternetAvailable()==true else {
            
            guard  let rootViewController=(UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController else {
                return
            }
            DispatchQueue.main.async {
                rootViewController.showAlert(title: Constant.MESSAGE_INTERNET_LOST_TITLE, message: Constant.MESSAGE_INTERNET_LOST) { (action) in
                    Utility.openSettingApp()
                    DispatchQueue.main.asyncAfter(deadline: .now()+1.0) {
                        exit(0)
                    }
                }
            }
            return
        }
        
        if canShowHud{
            DispatchQueue.main.async {
                SVProgressHUD.show()
                SVProgressHUD.setDefaultMaskType(.clear)
            }
        }
        
        Alamofire.request(apiUrl, method: .delete, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { response in
                
                if canShowHud{
                    DispatchQueue.main.async {
                        SVProgressHUD.dismiss()
                    }
                }
                
                switch response.result {
                    
                case .success(_):
                    
                    let prettyPrintedResponse = NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue)
                    print(prettyPrintedResponse!)
                    do{
                        let responseDict = try JSONSerialization.jsonObject(with: response.data!, options: JSONSerialization.ReadingOptions(rawValue: String.Encoding.utf8.rawValue)) as! [String:Any]
                        
                        let responseModel = ResponseModel(fromDictionary: responseDict)
                        
                        if let success = responseModel.success, success == false{
                            guard  let rootViewController=(UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController else {
                                return
                            }
                            rootViewController.view.makeToast(responseModel.message)
                        }else{
                            completionHandler(responseModel)
                        }
                        
                    }
                    catch{
                        print("failed to serialize, \(error.localizedDescription)")
                    }
                    
                case .failure(let error):
                    
                    print(error.localizedDescription)
                    guard  let rootViewController=(UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController else {
                        return
                    }
                    rootViewController.view.makeToast(error.localizedDescription)
                    
                }
        }
        
    }
    
    //MARK:- POST REQUEST
    static func postRequest(apiUrl: String, parameters : [String:AnyObject] , headers : [String:String] = defaultHeaders ,canShowHud : Bool,completionHandler : @escaping (_ result: ResponseModel)->()) {
        
        print("post request url :-  *\(apiUrl)*")
        print("post request body :-  *\(parameters)*")
        guard isInternetAvailable()==true else {
            
            guard  let rootViewController=(UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController else {
                return
            }
            DispatchQueue.main.async {
                rootViewController.showAlert(title: Constant.MESSAGE_INTERNET_LOST_TITLE, message: Constant.MESSAGE_INTERNET_LOST) { (action) in
                    Utility.openSettingApp()
                    DispatchQueue.main.asyncAfter(deadline: .now()+1.0) {
                        exit(0)
                    }
                }
            }
            return
        }
        
        if canShowHud{
            DispatchQueue.main.async {
                SVProgressHUD.show()
                SVProgressHUD.setDefaultMaskType(.clear)
            }
        }
        
        Alamofire.request(apiUrl, method: .post, parameters: parameters ,encoding: JSONEncoding.default, headers: headers)
            .responseJSON { response in
                
                if canShowHud{
                    DispatchQueue.main.async {
                        SVProgressHUD.dismiss()
                    }
                }
                switch response.result {
                case .success( _):
                    
                    let prettyPrintedResponse = NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue)
                    print(prettyPrintedResponse!)
                    do{
                        let responseDict = try JSONSerialization.jsonObject(with: response.data!, options: JSONSerialization.ReadingOptions(rawValue: String.Encoding.utf8.rawValue)) as! [String:Any]
                        
                        let responseModel = ResponseModel(fromDictionary: responseDict)
                        
                        if let success = responseModel.success, success == false{
                            if(responseModel.errorCode == 409){
                                // unauthorized access
                                Utility.showUnauthorizedAccessAlert()
                            }else if(responseModel.errorCode == 12){
                                completionHandler(responseModel)
                            }else if(responseModel.errorCode == 100){
                                //fb user not found
                                completionHandler(responseModel)
                            }else{
                                guard  let rootViewController=(UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController else {
                                    return
                                }
                                if(responseModel.message != nil && responseModel.message == "No offer found")
                                {
                                    completionHandler(responseModel)
                                }
                                else
                                {
                                    rootViewController.view.makeToast(responseModel.message)
                                }
                                
                            }
                        }else{
                            completionHandler(responseModel)
                        }
                    }
                    catch{
                        guard  let rootViewController=(UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController else {
                            return
                        }
                        rootViewController.view.makeToast(error.localizedDescription)
                        print("failed to serialize, \(error.localizedDescription)")
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    guard  let rootViewController=(UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController else {
                        return
                    }
                    rootViewController.view.makeToast(error.localizedDescription)
                }
                
        }
        
    }
    
    //MARK:- MULTIPART REQUEST
    static func multiPartRequest(apiUrl: String, parameters : [String:String], headers : [String:String] = defaultHeaders , fileData: Data, fileName: String, mimeType: String , canShowHud: Bool ,completionHandler : @escaping (_ result: NSDictionary)->(),progressHandler : @escaping (_ progress: Progress)->())  {
        var customHeaders = headers
        customHeaders["Content-Type"] = "application/json;charset=UTF-8"
        guard isInternetAvailable()==true else {
            
            guard  let rootViewController=(UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController else {
                return
            }
            DispatchQueue.main.async {
                rootViewController.showAlert(title: Constant.MESSAGE_INTERNET_LOST_TITLE, message: Constant.MESSAGE_INTERNET_LOST) { (action) in
                    Utility.openSettingApp()
                    DispatchQueue.main.asyncAfter(deadline: .now()+1.0) {
                        exit(0)
                    }
                }
            }
            return
        }
        
        if canShowHud{
            DispatchQueue.main.async {
                SVProgressHUD.show()
                SVProgressHUD.setDefaultMaskType(.clear)
            }
        }
        
        Alamofire.upload(multipartFormData: { MultipartFormData in
            for (key, value) in parameters {
                MultipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
            }
            
            MultipartFormData.append(fileData, withName: "file", fileName: fileName, mimeType: mimeType)
            
        }, to: apiUrl, headers: customHeaders) { (result) in
            
            switch result {
            case .success(let upload, _, _):
                
                upload.response { response in
                    if canShowHud{
                        DispatchQueue.main.async {
                            SVProgressHUD.dismiss()
                        }
                    }
                    guard let prettyPrintedString = NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue) else { return  }
                    print(prettyPrintedString)
                    
                    let jsonResult = try! JSONSerialization.jsonObject(with: response.data!, options:JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                    
                    completionHandler(jsonResult!)
                }
                upload.uploadProgress { progress in
                    //call progress callback here if you need it
                    progressHandler(progress)
                }
                
            case .failure(let encodingError):
                if canShowHud{
                    DispatchQueue.main.async {
                        SVProgressHUD.dismiss()
                    }
                }
                print("multipart upload encodingError: \(encodingError)")
                guard  let rootViewController=(UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController else {
                    return
                }
                rootViewController.view.makeToast(encodingError.localizedDescription)
            }
            
            
        }
    }
    
    
    static  func getVersionApiCall( completion : @escaping(Double, String)->()) {
        let apiUrl = Constant.BASE_URL + Constant.kGet_Version
        WebServiceHelper.getRequest(apiUrl: apiUrl, canShowHud: true) { (responseModel) in
            if let success = responseModel.success, success == true{
                guard let strVersionCode = responseModel.responsePacket as? String else { return  }
                let message = responseModel.message ?? ""
                let versionCode = Double(strVersionCode) ?? 0.0
                completion(versionCode,message)
            }else{
                if let errorCode = responseModel.errorCode, errorCode == 1000{
                    Utility.showAlertWithMsg(with: responseModel.message ?? "")
                }else{
                    Utility.showAlertWithMsg(with: responseModel.message ?? "")
                }
            }
        }
    }
    
    
    //MARK:- CHECK INTERNET CONNECTION
    class func isInternetAvailable() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
    
}

