//
//  UIViewController+Navigation.swift
//  StarbucksList
//
//  Created by 정강우 on 7/19/25.
//

import UIKit

extension UIViewController {
    
    func setupCustomNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        setupTopBackground()
        
        let customNavBar = CustomNavigationBar()
        view.addSubview(customNavBar)
        
        NSLayoutConstraint.activate([
            customNavBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            customNavBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customNavBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupTopBackground() {
        let topBackground = UIView()
        topBackground.backgroundColor = .systemBackground
        topBackground.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(topBackground)
        
        NSLayoutConstraint.activate([
            topBackground.topAnchor.constraint(equalTo: view.topAnchor),
            topBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topBackground.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    func setNavigationTitle(_ title: String) {
        if let customNavBar = view.subviews.compactMap({ $0 as? CustomNavigationBar }).first {
            customNavBar.setTitle(title)
        }
    }
    
    func setBackButtonAction(_ action: @escaping () -> Void) {
        if let customNavBar = view.subviews.compactMap({ $0 as? CustomNavigationBar }).first {
            customNavBar.setBackButtonAction(action)
        }
    }
    
    func setSearchButtonAction(_ action: @escaping () -> Void) {
        if let customNavBar = view.subviews.compactMap({ $0 as? CustomNavigationBar }).first {
            customNavBar.setSearchButtonAction(action)
        }
    }
}
