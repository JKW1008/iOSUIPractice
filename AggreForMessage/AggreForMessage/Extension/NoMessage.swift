//
//  NoMessage.swift
//  AggreForMessage
//
//  Created by 정강우 on 6/29/25.
//

import UIKit

extension UIView {
    func addNomessage(text: String, agreeButton: UIButton, topSpacingRatio: CGFloat = 0.02) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let attributedString = NSAttributedString(
            string: text,
            attributes: [
                .font: UIFont.systemFont(ofSize: self.bounds.width * 0.03, weight: .medium),
                .foregroundColor: UIColor.black,
                .underlineStyle: NSUnderlineStyle.single.rawValue
            ]
        )
        label.attributedText = attributedString
        label.textAlignment = .center
//        label.isUserInteractionEnabled = true
        
        self.addSubview(label)
        
        let spacing = self.bounds.height * topSpacingRatio
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.topAnchor.constraint(equalTo: agreeButton.bottomAnchor, constant: spacing),
        ])
        return label
    }
}
