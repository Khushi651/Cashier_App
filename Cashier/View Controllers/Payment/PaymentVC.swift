//
//  PaymentVC.swift
//  Cashier
//
//  Created by Appic Softwares on 08/01/21.
//

import UIKit

class PaymentVC: UIViewController {
    
    static func getObject()-> PaymentVC {
        let storyboard = UIStoryboard(name: "Payment", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: String.className(PaymentVC.self)) as? PaymentVC
        if let vc = vc {
            return vc
        }
        return PaymentVC()
    }
    
    //MARK:- OUTLETS
    
    //MARK:- LOCAL VARIABLES
    
    //MARK:- PROPERTY OBSERVERS
    
    //MARK:- METHODS
    
    //MARK:- SETUP METHODS
    
    //MARK:- LIFE CYCLE METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK:- IBACTIONS
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
