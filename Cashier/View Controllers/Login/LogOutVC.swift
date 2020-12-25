//
//  LogOutVC.swift
//  Cashier
//
//  Created by Appic Softwares on 24/12/20.
//

import UIKit

class LogOutVC: UIViewController {
    
  
    static func getObject()-> LogOutVC {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: String.className(LogOutVC.self)) as? LogOutVC
        if let vc = vc {
            return vc
        }
        return LogOutVC()
    }
    
    
    //MARK:- OUTLETS
    
    //MARK:- LOCAL VARIABLES
    
    //MARK:- PROPERTY OBSERVERSs
    
    //MARK:- METHODS
    
    //MARK:- SETUP METHODS
    
    //MARK:- LIFE CYCLE METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK:- IBACTIONS
    
    @IBAction func cntrlCancel(_ sender: UIControl) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cntrlClockedOut(_ sender: UIControl) {
        self.dismiss(animated: true, completion: nil)
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
