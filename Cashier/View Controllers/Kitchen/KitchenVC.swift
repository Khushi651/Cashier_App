//
//  KitchenVC.swift
//  Cashier
//
//  Created by Appic Softwares on 07/01/21.
//

import UIKit

class KitchenVC: UIViewController {
    
    static func getObject()-> KitchenVC {
        let storyboard = UIStoryboard(name: "Kitchen", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: String.className(KitchenVC.self)) as? KitchenVC
        if let vc = vc {
            return vc
        }
        return KitchenVC()
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
