//
//  BorderedView.swift
//  PyramidGold
//
//  Created by Suresh on 14/10/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class BorderedView: UIView {
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
        path.lineWidth = borderWidth
        
        borderColor?.setStroke()
        
        let dashPattern : [CGFloat] = [10, 4]
        path.setLineDash(dashPattern, count: 2, phase: 0)
        path.stroke()
    }
    
}
