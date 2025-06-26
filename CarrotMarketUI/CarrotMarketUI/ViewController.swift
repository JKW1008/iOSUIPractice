//
//  ViewController.swift
//  CarrotMarketUI
//
//  Created by 정강우 on 6/25/25.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView: UIImageView!
    var titleLabel: UILabel!
    var subtitleLabel: UILabel!
    var startButton: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        imageView = view.addCenteredImageView(imageName: "logo")
        
        let labels = view.addTitleLabels(
            title: "당신 근처의 당근마켓",
            subtitle: "중고 거래부터 동네 정보까지,\n지금 내 동네를 선택하고 시작해보세요!",
            imageView: imageView,
            titleSpacingRatio: 0.015,
            subtitleSpacingRatio: 0.015
        )
        
        titleLabel = labels.titleLabel
        subtitleLabel = labels.subtitleLabel
        startButton = view.addStartButton()
        
        view.addLoginLabel(title: "이미 계정이 있나요?", subTitle: " 로그인", button: startButton)
    }
}

