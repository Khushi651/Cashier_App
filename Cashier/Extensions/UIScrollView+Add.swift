//
//  UIScrollView+Add.swift
//  PyramidGold
//
//  Created by MAC on 16/01/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation

extension UIScrollView {
   func scrollToBottom(animated: Bool) {
     if self.contentSize.height < self.bounds.size.height { return }
     let bottomOffset = CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height)
     self.setContentOffset(bottomOffset, animated: animated)
  }

    func scrollToTop(animated: Bool) {
        self.setContentOffset(.zero, animated: animated)
    }
    
}
