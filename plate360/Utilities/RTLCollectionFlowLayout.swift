//
//  RTLCollectionFlowLayout.swift
//  plate360
//
//  Created by Aviran Dabush on 04/11/2025.
//

import UIKit

class RTLCollectionFlowLayout: UICollectionViewFlowLayout {
    override var flipsHorizontallyInOppositeLayoutDirection: Bool {
        return true
    }
}
