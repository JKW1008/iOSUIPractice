//
//  NavigationBar.swift
//  CarrotList
//
//  Created by 정강우 on 7/8/25.
//

import UIKit

class CustomNavigationBar: UINavigationBar {
    private let localName = UILabel()
    private let underArrow = UIImageView(image: UIImage(systemName: "chevron.down", withConfiguration: UIImage.SymbolConfiguration(weight: .semibold)))
    private let searchIcon = UIImageView(image: UIImage(systemName: "magnifyingglass"))
    private let menuIcon = UIImageView(image: UIImage(systemName: "list.bullet"))
    private let alarmIcon = UIImageView(image: UIImage(systemName: "bell"))
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
        setupNavigationBar()
        setupLeftStackView()
        setupRightStackView()
    }
    
    private func setupNavigationBar() {
        backgroundColor = .systemBackground
        let navigationBarHeight = screenHeight * 0.064
        translatesAutoresizingMaskIntoConstraints = false
        
        
        heightAnchor.constraint(equalToConstant: navigationBarHeight).isActive = true
        
        let bottomBorder = UIView()
        bottomBorder.backgroundColor = .systemGray5
        bottomBorder.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(bottomBorder)
        
        NSLayoutConstraint.activate([
            bottomBorder.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomBorder.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomBorder.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomBorder.heightAnchor.constraint(equalToConstant: 2)
        ])
    }
    
    private func setupLeftStackView() {
        localName.text = "조영동"
        localName.font = UIFont.systemFont(ofSize: screenWidth * 0.05, weight: .heavy)
        underArrow.tintColor = .black
        
        underArrow.contentMode = .scaleAspectFit
        
        let leftStackView = UIStackView(arrangedSubviews: [localName, underArrow])
        leftStackView.axis = .horizontal
        leftStackView.spacing = screenWidth * 0.02
        leftStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(leftStackView)
        
        NSLayoutConstraint.activate([
            underArrow.widthAnchor.constraint(equalToConstant: screenWidth * 0.05),
            underArrow.heightAnchor.constraint(equalToConstant: screenHeight * 0.05),
            
            leftStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: screenWidth * 0.04),
            leftStackView.widthAnchor.constraint(equalToConstant: screenWidth * 0.2),
            leftStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func setupRightStackView() {
        searchIcon.tintColor = .black
        searchIcon.contentMode = .scaleAspectFit
        menuIcon.tintColor = .black
        menuIcon.contentMode = .scaleAspectFit
        alarmIcon.tintColor = .black
        alarmIcon.contentMode = .scaleAspectFit
        
        let rightStackView = UIStackView(arrangedSubviews: [searchIcon, menuIcon, alarmIcon])
        rightStackView.axis = .horizontal
        rightStackView.spacing = screenWidth * 0.03
        rightStackView.distribution = .fillEqually
        rightStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(rightStackView)
        
        let iconSize = screenWidth * 0.065
        
        NSLayoutConstraint.activate([
            searchIcon.widthAnchor.constraint(equalToConstant: iconSize),
            searchIcon.heightAnchor.constraint(equalToConstant: iconSize),
            
            menuIcon.widthAnchor.constraint(equalToConstant: iconSize),
            menuIcon.heightAnchor.constraint(equalToConstant: iconSize),
            
            alarmIcon.widthAnchor.constraint(equalToConstant: iconSize),
            alarmIcon.heightAnchor.constraint(equalToConstant: iconSize),
            
            rightStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -(screenWidth * 0.04)),
            rightStackView.widthAnchor.constraint(equalToConstant: screenWidth * 0.3),
            rightStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
