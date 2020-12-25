//
//  UIView+ShimmerEffect.swift
//  PyramidGold
//
//  Created by MAC on 21/10/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import Foundation
import UIKit
import ShimmerSwift


extension UIView{
    
    func addShimmerEffect() -> UIView {
        let shimmerView = ShimmeringView(frame: self.bounds)
        let containerView = UIView(frame: self.bounds)
        containerView.addSubview(shimmerView)
        shimmerView.contentView = self
        shimmerView.isShimmering = true
        //shimmerView.shimmerPauseDuration = 0.4
        //shimmerView.shimmerSpeed = 180        
        return containerView
    }
    
}
