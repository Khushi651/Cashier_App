//
//  SelfSizedCollectionView.swift
//  PyramidGold
//
//  Created by MAC on 06/12/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import Foundation
import UIKit

class SelfSizedCollectionView: UICollectionView {
    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
    }

    override var intrinsicContentSize: CGSize {
        let s = self.collectionViewLayout.collectionViewContentSize
        return CGSize(width: max(s.width, 1), height: max(s.height,1))
    }

}
