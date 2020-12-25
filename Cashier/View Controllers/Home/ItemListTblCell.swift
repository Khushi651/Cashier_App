//
//  ItemListTblCell.swift
//  Cashier
//
//  Created by Appic Softwares on 25/12/20.
//

import UIKit

class ItemListTblCell: UITableViewCell {
    
    
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblItemName: UILabel!
    @IBOutlet weak var vwData: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
