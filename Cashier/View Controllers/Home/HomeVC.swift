//
//  HomeVC.swift
//  Cashier
//
//  Created by Appic Softwares on 23/12/20.
//

import UIKit

class HomeVC: UIViewController {
    
    
    static func getObject()-> HomeVC {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: String.className(HomeVC.self)) as? HomeVC
        if let vc = vc {
            return vc
        }
        return HomeVC()
    }
    
    
    //MARK:- OUTLETS
    
    @IBOutlet weak var tblVW: UITableView!
    @IBOutlet weak var colOptions: UICollectionView!
    @IBOutlet weak var colData: UICollectionView!
    @IBOutlet weak var vwSearch: UIView!
    @IBOutlet weak var vwFooter: UIView!
    
    //MARK:- LOCAL VARIABLES
    
    //MARK:- PROPERTY OBSERVERS
    
    //MARK:- BUSINESS LOGIC METHODS
    
  
    
    //MARK:- LIFE CYCLE METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        // Do any additional setup after loading the view.
    }
    
    //MARK:- SETUP METHODS
    
    func setUI()
    {
        let nibOfLargeCell = UINib(nibName: String.className(ItemListTblCell.self), bundle: nil)
        tblVW.register(nibOfLargeCell, forCellReuseIdentifier: String.className(ItemListTblCell.self))
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
