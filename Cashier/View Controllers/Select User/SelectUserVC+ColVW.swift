//
//  SelectUserVC+ColVW.swift
//  Cashier
//
//  Created by Appic Softwares on 23/12/20.
//

import Foundation
import UIKit

extension SelectUserVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectUserColCell", for: indexPath) as! SelectUserColCell
        cell.vwUserData.layer.shadowColor = UIColor.lightGray.cgColor
        cell.vwUserData.layer.shadowOpacity = 0.4
        cell.vwUserData.layer.shadowOffset = .zero
        cell.vwUserData.layer.shadowRadius = 4
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfSets = CGFloat(3.0)
        let width = (collectionView.frame.size.width - (numberOfSets * view.frame.size.width / 14))/numberOfSets
        return CGSize(width: collectionView.frame.size.width/3.0-10.0, height: 250.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(LoginVC.getObject(), animated: true)
    }
}
