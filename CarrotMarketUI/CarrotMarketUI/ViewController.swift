//
//  ViewController.swift
//  CarrotMarketUI
//
//  Created by 정강우 on 6/25/25.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView: UIImageView = {
        let aImageView = UIImageView()
        aImageView.image = UIImage(named: "logo")
        aImageView.contentMode = .scaleAspectFit
        //  autoLayout 방지
        aImageView.translatesAutoresizingMaskIntoConstraints = false
        return aImageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        
        //  실제 이미지 비율 계산
        if let image = UIImage(named: "logo") {
            let aspectRatio = image.size.height / image.size.width
            
            
            NSLayoutConstraint.activate([
                imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.bounds.height * 0.25),
                imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
                imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: aspectRatio)
            ])
        }
        // Do any additional setup after loading the view.
    }
}

