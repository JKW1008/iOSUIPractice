//
//  ViewController.swift
//  CarrotMarketUI
//
//  Created by 정강우 on 6/25/25.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        imageView = view.addCenteredImageView(imageName: "logo")
    }
}

