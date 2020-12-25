//
//  SelfSizedTableView.swift
//  PyramidGold
//
//  Created by MAC on 09/01/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation

class SelfSizedTableView: UITableView {
    
  var maxHeight: CGFloat = UIScreen.main.bounds.size.height
  
  override func reloadData() {
    super.reloadData()
    self.invalidateIntrinsicContentSize()
    self.layoutIfNeeded()
  }
  
  override var intrinsicContentSize: CGSize {
    setNeedsLayout()
    layoutIfNeeded()
    let height = max(contentSize.height,maxHeight)
    return CGSize(width: contentSize.width, height: height)
  }
    
}
