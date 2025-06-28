//
//  WarningLabel.swift
//  AggreForMessage
//
//  Created by 정강우 on 6/29/25.
//

import UIKit

extension UIView {
    func addWarningLabel(text: String, inputText: UITextField, titleSpacingRatio: CGFloat = 0.02) -> UILabel {
        let textLabel = UILabel()
        textLabel.text = text
        textLabel.font = UIFont.systemFont(ofSize: self.bounds.width * 0.035, weight: .medium)
        textLabel.textColor = .systemGray4
        textLabel.textAlignment = .left
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(textLabel)
        
        let spacing = self.bounds.height * titleSpacingRatio
        
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: inputText.leadingAnchor),
            textLabel.topAnchor.constraint(equalTo: inputText.bottomAnchor, constant: spacing)
        ])
        return textLabel
    }
}
