//
//  ViewController.swift
//  SignUpUIpractice
//
//  Created by 정강우 on 6/26/25.
//

import UIKit

class ViewController: UIViewController {

    var imageView: UIImageView!
    var titleLabel: UILabel!
    var subtitleLabel: UILabel!
    var textIput: UITextField!
    var messageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = view.addBsackArrow(imageName: "chevron.left")
        
        let labels = view.addTitles(
            title: "안녕하세요!\n휴대폰 번호로 가입해주세요.",
            subTitle: "휴대폰 번호는 안전하게 보관되며 이웃들에게 공개되지 않아요.",
            arrowButton: imageView,
            titleSpacingRatio: 0.03,
            subtitleSpacingRatio: 0.02
        )
        
        titleLabel = labels.titleLabel
        subtitleLabel = labels.subtitleLabel
        textIput = view.addTextField(placeholder: "휴대폰 번호(-없이 숫자만 입력)", subtitleLabel: subtitleLabel, topSpacingRatio: 0.02)
        messageButton = view.addMessageButton(title: "인증문자 받기", topSpacingRatio: 0.02, textField: textIput)
        
        view.addForgetAccountLabel(title: "휴대폰 번호가 변경되었나요?", subTitle: " 이메일로 계정 찾기", button: messageButton, titleSpacingRatio: 0.035)
    }
}

