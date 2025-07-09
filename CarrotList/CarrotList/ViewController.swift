//
//  ViewController.swift
//  CarrotList
//
//  Created by 정강우 on 7/8/25.
//

import UIKit

class ViewController: UIViewController {
    private var customNavigationBar = CustomNavigationBar()
    private var customHomeBar = CustomHomeBar()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(true, animated: false)
        
        setupCustomNavigationBar()
        setupCustomHomeBar()
    }

    private func setupCustomNavigationBar() {
        view.addSubview(customNavigationBar)
        
        NSLayoutConstraint.activate([
            customNavigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            customNavigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customNavigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupCustomHomeBar() {
        view.addSubview(customHomeBar)
        
        NSLayoutConstraint.activate([
            customHomeBar.bottomAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.bottomAnchor, multiplier: 1),
            customHomeBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customHomeBar.trailingAnchor.constraint(equalToSystemSpacingAfter: view.trailingAnchor, multiplier: 1)
        ])
    }
}

