//
//  MenuListTableViewCell.swift
//  StarbucksList
//
//  Created by 정강우 on 7/25/25.
//

import UIKit

class MenuListTableViewCell: UITableViewCell {
    static let identifier = "MenuListTableViewCell"
    
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemGray6
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: screenWidth * 0.04, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    private lazy var englishNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: screenWidth * 0.04, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: screenWidth * 0.035, weight: .regular)
        label.textColor = .gray
        return label
    }()
    
    private lazy var statusBadgeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: screenWidth * 0.03, weight: .medium)
        label.textColor = .white
        label.textAlignment = .center
        label.layer.cornerRadius = screenWidth * 0.02
        label.clipsToBounds = true
        label.isHidden = true
        
        return label
    }()
    
    private lazy var hotIconLabel: UILabel = {
        let label = UILabel()
        label.text = "🔥"
        label.font = UIFont.systemFont(ofSize: screenWidth * 0.04)
        label.isHidden = true  // 기본적으로 숨김
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        contentView.addSubview(productImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(englishNameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(statusBadgeLabel)
        contentView.addSubview(hotIconLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        englishNameLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        statusBadgeLabel.translatesAutoresizingMaskIntoConstraints = false  // 추가!
        hotIconLabel.translatesAutoresizingMaskIntoConstraints = false     
        
        let imageSize = screenWidth * 0.2
        
        NSLayoutConstraint.activate([
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: screenWidth *  0.04),
            productImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            productImageView.widthAnchor.constraint(equalToConstant: imageSize),
            productImageView.heightAnchor.constraint(equalToConstant: imageSize),
            
            nameLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: screenWidth * 0.04),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: screenHeight * 0.02),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -screenWidth * 0.04),
            
            englishNameLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            englishNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: screenHeight * 0.005),
            englishNameLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            priceLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            priceLabel.topAnchor.constraint(equalTo: englishNameLabel.bottomAnchor, constant: screenHeight * 0.01),
            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -screenHeight * 0.02),
            
            statusBadgeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -screenWidth * 0.04),
            statusBadgeLabel.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            statusBadgeLabel.widthAnchor.constraint(equalToConstant: screenWidth * 0.12),
            statusBadgeLabel.heightAnchor.constraint(equalToConstant: screenHeight * 0.025),
            
            hotIconLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: screenWidth * 0.02),
            hotIconLabel.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor),
        ])
        
        productImageView.layer.cornerRadius = imageSize / 2
    }
    
    func configure(with item: ProductItem) {
        nameLabel.text = item.name
        englishNameLabel.text = item.englishName
        priceLabel.text = item.formattedPrice
        productImageView.image = UIImage(named: item.imageName)
        
        if let statusBadge = item.statusBadge {
            statusBadgeLabel.isHidden = false
            statusBadgeLabel.text = statusBadge.rawValue
            statusBadgeLabel.backgroundColor = statusBadge.backgroundColor
        } else {
            statusBadgeLabel.isHidden = true
        }
        
        hotIconLabel.isHidden = !item.hasHotIcon
    }
}
