//
//  TabCell.swift
//  plate360
//
//  Created by Aviran Dabush on 29/10/2025.
//

import UIKit

class TabCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var currentTab: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(with title: String, isCurrentTab: Bool) {
        self.titleLabel.text = title
        currentTab.isHidden = !isCurrentTab
    }
}
