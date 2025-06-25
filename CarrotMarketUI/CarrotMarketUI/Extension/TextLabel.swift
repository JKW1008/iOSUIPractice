//
//  TextLabel.swift
//  CarrotMarketUI
//
//  Created by 정강우 on 6/25/25.
//

import UIKit

extension UIView {
    func addTitleLabels(title: String, subtitle: String, imageView: UIImageView, titleSpacingRatio: CGFloat =  0.05, subtitleSpacingRatio: CGFloat = 0.02) -> (titleLabel: UILabel, subtitleLabel: UILabel) {
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: self.bounds.width * 0.06, weight: .heavy)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let subtitleLabel = UILabel()
        subtitleLabel.text = subtitle
        subtitleLabel.font = UIFont.systemFont(ofSize: self.bounds.width * 0.045, weight: .semibold)
        subtitleLabel.textColor = .darkGray
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 2
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(titleLabel)
        self.addSubview(subtitleLabel)
        
        let titleSpacing = self.bounds.height * titleSpacingRatio
        let subtitleSpacing = self.bounds.height * subtitleSpacingRatio
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: titleSpacing),
            titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -20),
            
            subtitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: subtitleSpacing),
            subtitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            subtitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30)
        ])
        return (titleLabel, subtitleLabel)
    }
}
