//
//  EmptyView.swift
//  plate360
//
//  Created by Aviran Dabush on 03/11/2025.
//

import UIKit

class EmptyView: UIView {
    
    private lazy var logoWatermarkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo-circle")
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 0.1
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "empty.view.message.default".localized
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        backgroundColor = .clear
        addSubview(logoWatermarkImageView)
        addSubview(messageLabel)
        
        NSLayoutConstraint.activate([
            logoWatermarkImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoWatermarkImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            logoWatermarkImageView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 16),
            logoWatermarkImageView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -16),
            
            messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            messageLabel.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 16),
            messageLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -16)
        ])
    }
    
    func setMessage(_ text: String) {
        DispatchQueue.main.async {
            self.messageLabel.text = text
        }
    }
}
