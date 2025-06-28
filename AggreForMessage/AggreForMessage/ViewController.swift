//
//  ViewController.swift
//  AggreForMessage
//
//  Created by 정강우 on 6/29/25.
//

import UIKit

class ViewController: UIViewController {

    var arrowButton: UIImageView!
    var phonenumber: UITextField!
    var messageBtn: UIButton!
    var certification: UITextField!
    var waringLabel: UILabel!
    var agreeButton: UIButton!
    var noMessageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrowButton = view.addBsackArrow(imageName: "chevron.left")
        phonenumber = view.addTextField(placeholder: "휴대폰 번호(-없이 숫자만 입력)", arrowImage: arrowButton, messageButton: nil, topSpacingRatio: 0.02)
        messageBtn = view.addMessageButton(title: "인증문자 받기", topSpacingRatio: 0.02, textField: phonenumber)
        certification = view.addTextField(placeholder: "인증번호 입력", arrowImage: nil, messageButton: messageBtn, topSpacingRatio: 0.03)
        waringLabel = view.addWarningLabel(text: "어떤 경우에도 타인에게 공유하지 마세요!", inputText: certification)
        agreeButton = view.addAgreeButton(title: "동의하고 시작하기", warningMessage: waringLabel, numberInput: certification)
        noMessageLabel = view.addNomessage(text: "인증번호가 오지 않나요?", agreeButton: agreeButton, topSpacingRatio: 0.02)
    }
}

