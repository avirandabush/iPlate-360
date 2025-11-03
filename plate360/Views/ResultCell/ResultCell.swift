//
//  ResultCell.swift
//  plate360
//
//  Created by Aviran Dabush on 29/10/2025.
//

import UIKit

class ResultCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(item: DisplayItem) {
        self.titleLabel.text = item.title
        self.valueLabel.text = item.value
    }
}
