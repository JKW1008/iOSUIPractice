//
//  ViewController.swift
//  StarbucksList
//
//  Created by 정강우 on 7/19/25.
//

import UIKit

class ViewController: UIViewController {
    private var customNavigationBar = CustomNavigationBar()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        setupNavigationBar()
    }

    private func setupNavigationBar() {
        view.addSubview(customNavigationBar)
        NSLayoutConstraint.activate([
            customNavigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            customNavigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customNavigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

