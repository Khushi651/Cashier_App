//
//  HomeVC+TblVW.swift
//  Cashier
//
//  Created by Appic Softwares on 25/12/20.
//

import Foundation
import UIKit

extension HomeVC:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return getTblDataCell(indexPath: indexPath, tblView: tableView)
    }
    
    func getTblDataCell(indexPath: IndexPath, tblView: UITableView)-> UITableViewCell {
        guard let cell =  tblView.dequeueReusableCell(withIdentifier: String.className(ItemListTblCell.self)) as? ItemListTblCell  else {return UITableViewCell()}
        cell.vwData.drawDottedLine(start: CGPoint(x: cell.vwData.bounds.minX, y: cell.vwData.bounds.minY), end: CGPoint(x: cell.vwData.bounds.maxX, y:  cell.vwData.bounds.minY), view: cell.vwData)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
