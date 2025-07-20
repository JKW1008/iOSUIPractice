//
//  MenuBar.swift
//  StarbucksList
//
//  Created by 정강우 on 7/19/25.
//

import UIKit

class MenuBar: UIView {
    private let homeIcon = UIImageView(image: UIImage(systemName: "house"))
    private let payIcon = UIImageView(image: UIImage(systemName: "creditcard"))
    private let orderIcon = UIImageView(image: UIImage(systemName: "waterbottle.fill"))
    private let giftIcon = UIImageView(image: UIImage(systemName: "gift.fill"))
    private let otherIcon = UIImageView(image: UIImage(systemName: "ellipsis"))
    
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        setupMenuBar()
        setupMenuStackView()
    }
    
    private func setupMenuBar() {
        backgroundColor = .systemBackground
        let menuBarHeight = screenHeight * 0.08
        translatesAutoresizingMaskIntoConstraints = false
        
        heightAnchor.constraint(equalToConstant: menuBarHeight).isActive = true
        
        let topBorder = UIView()
        topBorder.backgroundColor = .systemGray5
        topBorder.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(topBorder)
        
        NSLayoutConstraint.activate([
            topBorder.leadingAnchor.constraint(equalTo: leadingAnchor),
            topBorder.trailingAnchor.constraint(equalTo: trailingAnchor),
            topBorder.topAnchor.constraint(equalTo: topAnchor),
            topBorder.heightAnchor.constraint(equalToConstant: 0.3)
        ])
    }
    
    private func setupMenuStackView() {
        let homeTab = createTabItem(icon: homeIcon, title: "Home")
        let payTab = createTabItem(icon: payIcon, title: "Pay")
        let orderTab = createTabItem(icon: orderIcon, title: "Order")
        let giftTab = createTabItem(icon: giftIcon, title: "Gift")
        let otherTab = createTabItem(icon: otherIcon, title: "Other")
        
        let stackView = UIStackView(arrangedSubviews: [homeTab, payTab, orderTab, giftTab, otherTab])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func createTabItem(icon: UIImageView, title: String) -> UIView {
        let contentView = UIView()

        icon.contentMode = .scaleAspectFit
        icon.translatesAutoresizingMaskIntoConstraints = false
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = .systemFont(ofSize: screenWidth * 0.03, weight: .medium)
        
        
        if icon == orderIcon {
            icon.tintColor = .systemGreen
            titleLabel.textColor = .systemGreen
        } else {
            icon.tintColor = .systemGray3
            titleLabel.textColor = .systemGray3
        }
        
        titleLabel.textAlignment = .center
        
        let stackView = UIStackView(arrangedSubviews: [icon, titleLabel])
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(stackView)
        
        let iconSize: CGFloat = screenWidth * 0.08
        
        NSLayoutConstraint.activate([
            icon.widthAnchor.constraint(equalToConstant: iconSize),
            icon.heightAnchor.constraint(equalToConstant: iconSize),
            
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        return contentView
    }
}
    
