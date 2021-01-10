//
//  UITextField+Add.swift
//  PyramidGold
//
//  Created by MAC on 24/10/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
    
    //MARK:- Set Left image
    /*
    *    Below method is used to set left image to text field.
    *      User can select it from storyboard.
    *     Default widht of left image is 39.
    */
    func setLeftImage(image: UIImage?,width:CGFloat=49)  {
        guard let img=image else {return}
        let left: UIImageView = UIImageView(frame: CGRect(x: 0.0, y: 0, width: self.frame.size.height, height: self.frame.size.height))
        left.image = img
        left.clipsToBounds=true
        left.contentMode = .center
        leftViewMode = .always
        self.leftView = left
    }
    //MARK:- Set Right image
    /*
    *    Below method is used to set right image to text field.
    *      User can select it from storyboard.
    *     Default widht of right image is 39.
    */
    func setRightImage(image: UIImage?,width:CGFloat=49)  {
        guard let img=image else {return}
        let right: UIImageView = UIImageView(frame: CGRect(x: 0.0, y: -15, width: self.frame.size.height-10, height: self.frame.size.height-15))
        right.image = img
        right.clipsToBounds=true
        right.contentMode = .center
        rightViewMode = .always
        self.rightView = right
    }
    
}
