//
//  VerticalFitLayout.swift
//  PyramidGold
//
//  Created by Suresh on 11/10/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit

class VerticalFitLayout: VerticalLayout {

    override init(width: CGFloat) {
        super.init(width: width)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        var height: CGFloat = 0
        var zeroHeightView: UIView?
        
        for i in 0..<subviews.count {
            var view = subviews[i] as UIView
            height += yOffsets[i]
            if view.frame.height == 0 {
                zeroHeightView = view
            } else {
                height += view.frame.height
            }
        }
        
        if height < superview!.frame.height && zeroHeightView != nil {
            zeroHeightView!.frame.size.height = superview!.frame.height - height
        }
        
        super.layoutSubviews()
        
    }

}
