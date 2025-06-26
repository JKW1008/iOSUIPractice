//
//  LoginLabel.swift
//  CarrotMarketUI
//
//  Created by 정강우 on 6/25/25.
//

import UIKit

extension UIView {
    func addLoginLabel(title: String, subTitle: String, button: UIButton, titleSpacingRatio: CGFloat = 0.03) {
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: self.bounds.width * 0.04, weight: .medium)
        titleLabel.textColor = .systemGray2
        titleLabel.textAlignment = .center
        
        let loginLabel = UILabel()
        loginLabel.text = subTitle
        loginLabel.font = UIFont.systemFont(ofSize: self.bounds.width * 0.04, weight: .bold)
        loginLabel.textColor = .carrotOrange
        loginLabel.textAlignment = .center
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(loginLabel)
        
        self.addSubview(stackView)
        
        let spacing = self.bounds.height * titleSpacingRatio
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: button.bottomAnchor, constant: spacing),
        ])
    }
}
