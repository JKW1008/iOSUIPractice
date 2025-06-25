//
//  StartButton.swift
//  CarrotMarketUI
//
//  Created by 정강우 on 6/25/25.
//

import UIKit

extension UIView {
    func addStartButton(bottomSpacingRatio: CGFloat = 0.08) -> UIButton {
        let startButton = UIButton(type: .system)
        startButton.setTitle("시작하기", for: .normal)
        startButton.setTitleColor(.white, for: .normal)
        startButton.titleLabel?.font = .systemFont(ofSize: self.bounds.width * 0.05, weight: .bold)
        startButton.backgroundColor = .carrotOrange
        startButton.layer.cornerRadius = 10
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(startButton)
        
        let buttonHeight: CGFloat = self.bounds.height * 0.06
        let bottomSpacing = self.bounds.height * bottomSpacingRatio
        
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            startButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -bottomSpacing),
            startButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
            startButton.heightAnchor.constraint(equalToConstant: buttonHeight)
        ])
        return startButton
    }
}
