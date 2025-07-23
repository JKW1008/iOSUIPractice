//
//  UIViewController+MenuBar.swift
//  StarbucksList
//
//  Created by 정강우 on 7/20/25.
//

import UIKit

extension UIViewController {
    func setupMenuBar() {
        let customMenuBar = MenuBar()
        
        customMenuBar.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(customMenuBar)
        
        NSLayoutConstraint.activate([
            customMenuBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customMenuBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customMenuBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
