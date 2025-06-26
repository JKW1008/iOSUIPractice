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
        
        startButton.addAction(UIAction { _ in print("Button tpped!")}, for: .touchUpInside)
        
        startButton.addAction(UIAction { _ in
            // 한 줄로 ViewController 찾기
            if let vc = self.next?.next as? UIViewController {
                let alert = UIAlertController(title: "당근마켓",
                                            message: "시작하기!",
                                            preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default))
                vc.present(alert, animated: true)
            }
        }, for: .touchUpInside)
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
