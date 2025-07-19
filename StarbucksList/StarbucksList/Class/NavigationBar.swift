//
//  NavigationBar.swift
//  StarbucksList
//
//  Created by 정강우 on 7/19/25.
//

import UIKit

class CustomNavigationBar: UIView {
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    
    private let backArrow = UIImageView(image: UIImage(systemName: "chevron.left", withConfiguration: UIImage.SymbolConfiguration(weight: .light)))
    private let magnifier = UIImageView(image: UIImage(systemName: "magnifyingglass", withConfiguration: UIImage.SymbolConfiguration(weight: .light)))
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "추천"
        label.font = UIFont.systemFont(ofSize: screenWidth * 0.045, weight: .semibold)
        label.textAlignment = .center
        label.textColor = .label
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupNavigationBar()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        backgroundColor = .systemBackground
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: screenHeight * 0.06).isActive = true
        
        addSubview(backArrow)
        addSubview(magnifier)
        addSubview(titleLabel)
        
        setupConstraints()
        setupIconColors()
        setupBottomShadow()
    }
    
    private func setupConstraints() {
        backArrow.translatesAutoresizingMaskIntoConstraints = false
        magnifier.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        backArrow.contentMode = .scaleAspectFit
        magnifier.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            backArrow.leadingAnchor.constraint(equalTo: leadingAnchor, constant: screenWidth * 0.04),
            backArrow.centerYAnchor.constraint(equalTo: centerYAnchor),
            backArrow.widthAnchor.constraint(equalToConstant: screenWidth * 0.04),
            backArrow.heightAnchor.constraint(equalToConstant: screenHeight * 0.04),
            
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            magnifier.trailingAnchor.constraint(equalTo: trailingAnchor, constant: screenWidth * -0.04),
            magnifier.centerYAnchor.constraint(equalTo: centerYAnchor),
            magnifier.widthAnchor.constraint(equalToConstant: screenWidth * 0.06),
            magnifier.heightAnchor.constraint(equalToConstant: screenHeight * 0.06),
        ])
    }
    
    private func setupIconColors() {
        backArrow.tintColor = .label
        magnifier.tintColor = .label
    }
    
    private func setupBottomShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 2
        layer.masksToBounds = false
        
        let bottomBorder = UIView()
        bottomBorder.backgroundColor = UIColor.separator.withAlphaComponent(0.1)
        bottomBorder.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(bottomBorder)
        
        NSLayoutConstraint.activate([
            bottomBorder.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomBorder.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomBorder.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomBorder.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
}
