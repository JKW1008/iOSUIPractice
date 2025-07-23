//
//  File.swift
//  StarbucksList
//
//  Created by 정강우 on 7/20/25.
//

import UIKit

class StoreBar: UIView {
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    
    private let dropdownIcon = UIImageView(image: UIImage(systemName: "chevron.down"))
    private let cartIcon = UIImageView(image: UIImage(systemName: "bag"))
    
    private let underLineView = UIView()
    
    private lazy var storeLabel: UILabel = {
        let label = UILabel()
        label.text = "주문할 매장을 선택해 주세요"
        label.font = UIFont.systemFont(ofSize: screenWidth * 0.04, weight: .semibold)
        label.textColor = .white
        label.alpha = 0.9
        return label
    }()
    
    private lazy var cartBadge: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.alpha = 0.9
        label.font = UIFont.systemFont(ofSize: screenWidth * 0.04, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    @objc private var storeSelectionAction: (() -> Void)?
    @objc private var cartAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStoreBar()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupStoreBar()
    }
    
    private func setupStoreBar() {
        backgroundColor = .black
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: screenHeight * 0.08).isActive = true
        
        addSubview(storeLabel)
        addSubview(dropdownIcon)
        addSubview(cartIcon)
        addSubview(cartBadge)
        addSubview(underLineView)
        
        setupConstraints()
        setupIconStyles()
        setupUnderLine()
        setupActions()
        setupShadow()
    }
    
    
    private func setupConstraints() {
        storeLabel.translatesAutoresizingMaskIntoConstraints = false
        dropdownIcon.translatesAutoresizingMaskIntoConstraints = false
        cartIcon.translatesAutoresizingMaskIntoConstraints = false
        cartBadge.translatesAutoresizingMaskIntoConstraints = false
        underLineView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            storeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: screenWidth * 0.05),
            storeLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            dropdownIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            dropdownIcon.trailingAnchor.constraint(equalTo: storeLabel.trailingAnchor, constant: screenWidth * 0.15),
            dropdownIcon.widthAnchor.constraint(equalToConstant: screenWidth * 0.045),
            dropdownIcon.heightAnchor.constraint(equalToConstant: screenHeight * 0.045),
            
            cartBadge.centerXAnchor.constraint(equalTo: cartIcon.centerXAnchor),
            cartBadge.centerYAnchor.constraint(equalTo: cartIcon.centerYAnchor, constant: screenHeight * 0.005),
            
            cartIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: screenWidth * -0.03),
            cartIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            cartIcon.widthAnchor.constraint(equalToConstant: screenWidth * 0.12),
            cartIcon.heightAnchor.constraint(equalToConstant: screenHeight * 0.12),
            
            underLineView.leadingAnchor.constraint(equalTo: storeLabel.leadingAnchor),
            underLineView.trailingAnchor.constraint(equalTo: dropdownIcon.trailingAnchor),
            underLineView.topAnchor.constraint(equalTo: storeLabel.bottomAnchor, constant: screenHeight * 0.01),
            underLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    private func setupIconStyles() {
        dropdownIcon.tintColor = .white
        dropdownIcon.alpha = 0.9
        dropdownIcon.contentMode = .scaleAspectFit
        
        cartIcon.tintColor = .white
        cartIcon.alpha = 0.8
        cartIcon.contentMode = .scaleAspectFit
    }
    
    private func setupUnderLine() {
        underLineView.backgroundColor = .white
        underLineView.alpha = 0.4
    }
    
    private func setupActions() {
         let storeSelectionTap = UITapGestureRecognizer(target: self, action: #selector(storeSelectionTapped))
         let cartTap = UITapGestureRecognizer(target: self, action: #selector(cartTapped))
         
         storeLabel.addGestureRecognizer(storeSelectionTap)
         storeLabel.isUserInteractionEnabled = true
         
         // 장바구니에 탭 제스처 추가
         cartIcon.addGestureRecognizer(cartTap)
         cartIcon.isUserInteractionEnabled = true
     }
     
    
    private func setupShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: -1)
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 2
    }
    
    func setStoreName(_ name: String) {
        storeLabel.text = name.isEmpty ? "주문할 매장을 선택해 주세요" : name
    }
    
    func setCartCount(_ count: Int) {
        cartBadge.text = "\(count)"
    }
    
    func setStoreSelectionAction(_ action: @escaping () -> Void) {
        storeSelectionAction = action
    }
    
    func setCartAction(_ action: @escaping () -> Void) {
        cartAction = action
    }
    
    @objc private func storeSelectionTapped() {
        storeSelectionAction?()
    }
    
    @objc private func cartTapped() {
        cartAction?()
    }
}

