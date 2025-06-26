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
        
        
    }
}

