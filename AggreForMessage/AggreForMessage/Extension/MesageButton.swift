//
//  MesageButton.swift
//  AggreForMessage
//
//  Created by 정강우 on 6/29/25.
//

import UIKit

extension UIView {
    func addMessageButton(title: String, topSpacingRatio: CGFloat = 0.05, textField: UITextField) -> UIButton {
        
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: self.bounds.width * 0.04, weight: .bold)
        button.backgroundColor = .systemBackground
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.systemGray4.cgColor
        button.layer.cornerRadius = 8.0
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addAction(UIAction { _ in print("Button tpped!")}, for: .touchUpInside)
        self.addSubview(button)

        let topSpacing = self.bounds.height * topSpacingRatio
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: topSpacing),
            button.widthAnchor.constraint(equalTo: textField.widthAnchor, multiplier: 1),
            button.heightAnchor.constraint(equalTo: textField.heightAnchor, multiplier: 1)
        ])
        return button
    }
}
