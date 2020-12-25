//
//  OtpTextField.swift
//  PyramidGold
//
//  Created by MAC on 23/10/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import Foundation
import UIKit

class OtpTextField : UITextField, UITextFieldDelegate{
    
    var onBackSpaceFired : ()->Void = {
        
    }
    
    // MARK: Life cycle
    
    override func awakeFromNib() {
        delegate = self
        super.awakeFromNib()
    }

    // MARK: Methods

    override func deleteBackward() {
        super.deleteBackward()
        backSpacePressed()
    }
    
    
    override func caretRect(for position: UITextPosition) -> CGRect {
        return CGRect.zero
    }
     
     
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
         
        if action == #selector(copy(_:)) || action == #selector(selectAll(_:)) || action == #selector(paste(_:)) {
             
            return false
        }
         
        return super.canPerformAction(action, withSender: sender)
    }
    
    func backSpacePressed(){
        onBackSpaceFired()
    }
    
    //MARK:- TEXT FIELD DELEGATE METHODS
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
         guard let text = textField.text else { return true }
         let newLength = text.count + string.count - range.length
         return newLength <= 1
    }
}
