//
//  LoginVC.swift
//  Cashier
//
//  Created by Appic Softwares on 23/12/20.
//

import UIKit

class LoginVC: UIViewController {
   
    static func getObject()-> LoginVC {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: String.className(LoginVC.self)) as? LoginVC
        if let vc = vc {
            return vc
        }
        return LoginVC()
    }
    
    @IBOutlet weak var vwRegisterDevice: UIView!
    @IBOutlet weak var vWClockIN: UIView!
    @IBOutlet weak var vwLoginIn: UIControl!
    
    //MARK:- OUTLETS
    
    //MARK:- LOCAL VARIABLES
    
    //MARK:- PROPERTY OBSERVERS
    
    
    
    //MARK:- LIFE CYCLE METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        // Do any additional setup after loading the view.
    }
    
    //MARK:- SETUP METHODS
    
    func setUI()
    {
        vwLoginIn.layer.shadowColor = UIColor.lightGray.cgColor
        vwLoginIn.layer.shadowOpacity = 0.4
        vwLoginIn.layer.shadowOffset = .zero
        vwLoginIn.layer.shadowRadius = 15
        vwLoginIn.layer.cornerRadius = 35.0
        vwLoginIn.layer.masksToBounds = true
        
    }
    
    
    //MARK:- BUSINESS LOGIC METHODS
    
    //MARK:- IBACTIONS
    
    
    @IBAction func vwLoginClicked(_ sender: UIControl) {
        self.navigationController?.pushViewController(OtpVC.getObject(), animated: true)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
