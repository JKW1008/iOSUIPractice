//
//  TextLabel.swift
//  SignUpUIpractice
//
//  Created by 정강우 on 6/26/25.
//

import UIKit

extension UIView {
    func addTitles(title: String, subTitle: String, arrowButton: UIImageView, titleSpacingRatio: CGFloat = 0.05, subtitleSpacingRatio: CGFloat = 0.02) -> (titleLabel: UILabel, subtitleLabel: UILabel) {
        
        let titleLabel = UILabel()
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = self.bounds.height * 0.005
        paragraphStyle.alignment = .left
        
        let attributedTitle = NSAttributedString(
                string: title,
            attributes: [
                .font: UIFont.systemFont(ofSize: self.bounds.width * 0.065, weight: .heavy),
                .foregroundColor: UIColor.black,
                .paragraphStyle: paragraphStyle
            ]
        )
        titleLabel.attributedText = attributedTitle
        titleLabel.numberOfLines = 2
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        let subtitleLabel = UILabel()
        subtitleLabel.text = subTitle
        subtitleLabel.font = UIFont.systemFont(ofSize: self.bounds.width * 0.037, weight: .medium)
        subtitleLabel.textColor = .black
        subtitleLabel.textAlignment = .left
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(titleLabel)
        self.addSubview(subtitleLabel)
        
        let titleSpacing = self.bounds.height * titleSpacingRatio
        let subtitleSpacing = self.bounds.height * subtitleSpacingRatio
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: arrowButton.bottomAnchor, constant: titleSpacing),
            titleLabel.leadingAnchor.constraint(equalTo: arrowButton.leadingAnchor),

            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: subtitleSpacing),
            subtitleLabel.leadingAnchor.constraint(equalTo: arrowButton.leadingAnchor),
        ])
        return (titleLabel, subtitleLabel)
    }
}
