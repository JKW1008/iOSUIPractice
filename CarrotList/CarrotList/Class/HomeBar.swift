//
//  HomeBar.swift
//  CarrotList
//
//  Created by 정강우 on 7/8/25.
//

import UIKit

class CustomHomeBar: UIView {
    private let homeIcon = UIImageView(image: UIImage(systemName: "house"))
    private let listIcon = UIImageView(image: UIImage(systemName: "doc.text"))
    private let locationIcon = UIImageView(image: UIImage(systemName: "location"))
    private let messageIcon = UIImageView(image: UIImage(systemName: "message"))
    private let profileIcon = UIImageView(image: UIImage(systemName: "person"))
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        setupHomeBar()
        setupHomeStackView()
    }
    
    private func setupHomeBar() {
        backgroundColor = .systemBackground
        let homeBarHeight = screenHeight * 0.08
        translatesAutoresizingMaskIntoConstraints = false
        
        heightAnchor.constraint(equalToConstant: homeBarHeight).isActive = true
        
        let topBorder = UIView()
        topBorder.backgroundColor = .systemGray5
        topBorder.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(topBorder)
        
        NSLayoutConstraint.activate([
            topBorder.leadingAnchor.constraint(equalTo: leadingAnchor),
            topBorder.trailingAnchor.constraint(equalTo: trailingAnchor),
            topBorder.topAnchor.constraint(equalTo: topAnchor),
            topBorder.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    private func setupHomeStackView() {
        let homeTab = createTabItem(icon: homeIcon, title: "홈")
        let listTab = createTabItem(icon: listIcon, title: "동네생활")
        let locationTab = createTabItem(icon: locationIcon, title: "내 근처")
        let messageTab = createTabItem(icon: messageIcon, title: "채팅")
        let profileTab = createTabItem(icon: profileIcon, title: "나의 당근")
        
        let stackView = UIStackView(arrangedSubviews: [homeTab, listTab, locationTab, messageTab, profileTab])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -0.02 * screenWidth),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),

        ])
    }
    
    private func createTabItem(icon: UIImageView, title: String) -> UIView {
        let containerView = UIView()
        
        icon.tintColor = .black
        icon.contentMode = .scaleAspectFit
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: screenWidth * 0.03, weight: .medium)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        
        let stackView = UIStackView(arrangedSubviews: [icon, titleLabel])
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(stackView)

        let iconSize: CGFloat = (title == "홈") ? screenWidth * 0.08 : screenWidth * 0.07
        NSLayoutConstraint.activate([
            icon.widthAnchor.constraint(equalToConstant: iconSize),
            icon.heightAnchor.constraint(equalToConstant: iconSize),
            
            stackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
        return containerView
    }
}
