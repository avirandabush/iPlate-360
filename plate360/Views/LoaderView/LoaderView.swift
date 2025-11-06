//
//  LoaderView.swift
//  plate360
//
//  Created by Aviran Dabush on 06/11/2025.
//

import UIKit

class LoaderView: UIView {

    private lazy var rotatingImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo-circle"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "loader.message".localized
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
        addSubview(rotatingImageView)
        addSubview(messageLabel)
        
        NSLayoutConstraint.activate([
            rotatingImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            rotatingImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -20),
            rotatingImageView.widthAnchor.constraint(equalToConstant: 80),
            rotatingImageView.heightAnchor.constraint(equalToConstant: 80),
            
            messageLabel.topAnchor.constraint(equalTo: rotatingImageView.bottomAnchor, constant: 16),
            messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    func startLoading() {
        isHidden = false
        rotate()
    }

    func stopLoading() {
        isHidden = true
        rotatingImageView.layer.removeAllAnimations()
    }

    private func rotate() {
        let rotation = CABasicAnimation(keyPath: "transform.rotation")
        rotation.fromValue = 0
        rotation.toValue = CGFloat.pi * 2
        rotation.duration = 1.2
        rotation.repeatCount = .infinity
        rotatingImageView.layer.add(rotation, forKey: "rotationAnimation")
    }
}

