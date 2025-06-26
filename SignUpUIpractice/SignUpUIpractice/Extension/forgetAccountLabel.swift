//
//  forgetAccountLabel.swift
//  SignUpUIpractice
//
//  Created by 정강우 on 6/26/25.
//
import UIKit

extension UIView {
    func addForgetAccountLabel(title: String, subTitle: String, button: UIButton, titleSpacingRatio: CGFloat = 0.03) {
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: self.bounds.width * 0.035, weight: .medium)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        
        let emailLabel = UILabel()
        let attributedString = NSAttributedString(
            string: subTitle,
            attributes: [
                .font: UIFont.systemFont(ofSize: self.bounds.width * 0.035, weight: .medium),
                .foregroundColor: UIColor.black,
                .underlineStyle: NSUnderlineStyle.single.rawValue
            ]
        )
        emailLabel.attributedText = attributedString
        emailLabel.textAlignment = .center
        emailLabel.isUserInteractionEnabled = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        emailLabel.addGestureRecognizer(tapGestureRecognizer)
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(emailLabel)
        
        self.addSubview(stackView)
        
        let spacing = self.bounds.height * titleSpacingRatio
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: button.bottomAnchor, constant: spacing),
        ])
    }
    
    @objc func handleTap() {
        print("forget Account?")
    }
}
