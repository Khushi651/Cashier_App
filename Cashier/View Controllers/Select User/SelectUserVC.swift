//
//  SelectUserVC.swift
//  Cashier
//
//  Created by Appic Softwares on 23/12/20.
//

import UIKit

class SelectUserVC: UIViewController {
    
    
    static func getObject()-> SelectUserVC {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: String.className(SelectUserVC.self)) as? SelectUserVC
        if let vc = vc {
            return vc
        }
        return SelectUserVC()
    }
    
    
    //MARK:- OUTLETS
    
    @IBOutlet weak var colVwData: UICollectionView!
    
    //MARK:- LOCAL VARIABLES
    
    //MARK:- PROPERTY OBSERVERS
    
    //MARK:- BUSINESS LOGIC METHODS
    
    
    //MARK:- LIFE CYCLE METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
        // Do any additional setup after loading the view.
    }
    
    //MARK:- SETUP METHODS
    
    func setUI()
    {
        self.navigationController?.navigationBar.isHidden = true
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
