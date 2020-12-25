//
//  HomeVC+ColVW.swift
//  Cashier
//
//  Created by Appic Softwares on 25/12/20.
//

import Foundation
import UIKit

extension  HomeVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case colOptions:
            return 7
        default:
            return 21
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case colOptions:
            return getOptionsCell(indexPath: indexPath, collectionView: collectionView)
        default:
            return getDataCell(indexPath: indexPath, collectionView: collectionView)
        }
    }
    
    func getOptionsCell(indexPath: IndexPath, collectionView: UICollectionView)-> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String.className(OptionsColCell.self), for: indexPath) as? OptionsColCell  else {return UICollectionViewCell()}
        switch indexPath.item {
        case 0:
            cell.lblData.text = "PRINT"
        case 1:
            cell.lblData.text = "KITCHEN"
        case 2:
            cell.lblData.text = "VOID"
        case 3:
            cell.lblData.text = "DISCOUNT"
        case 4:
            cell.lblData.text = "NOTES"
        case 4:
            cell.lblData.text = "TAGS"
        default:
            cell.lblData.text = "MORE"
        }
        return cell
    }
    
    func getDataCell(indexPath: IndexPath, collectionView: UICollectionView)-> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String.className(HomeDataColCell.self), for: indexPath) as? HomeDataColCell  else {return UICollectionViewCell()}
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case colOptions:
            return CGSize(width: colOptions.frame.width/6.0, height: 90.0)
        default:
            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
            let numberofItem: CGFloat = 3
            let collectionViewWidth = self.colData.bounds.width
            let extraSpace = (numberofItem - 1) * flowLayout.minimumInteritemSpacing
            let inset = flowLayout.sectionInset.right + flowLayout.sectionInset.left
            let width = Int((collectionViewWidth - extraSpace - inset) / numberofItem)
            print(width)
            return CGSize(width: width, height: 150)
        }
    }
    
    
}
