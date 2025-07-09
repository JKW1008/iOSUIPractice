//
//  List.swift
//  CarrotList
//
//  Created by 정강우 on 7/9/25.
//

import UIKit

struct ProductItem {
    let image: String
    let title: String
    let location: String
    let timeAgo: String
    let price: String
    let commentCount: Int
    let likeCount: Int
}


class ProductTableViewCell: UITableViewCell {
    private let productImageView = UIImageView()
    private let titleLabel = UILabel()
    private let locationLabel = UILabel()
    private let priceLabel = UILabel()
    private let commentIcon = UIImageView()
    private let commentLabel = UILabel()
    private let likeIcon = UIImageView()
    private let likeLabel = UILabel()
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        
    }
    
    private func setupProduceImageView() {
        productImageView.backgroundColor = .systemGray5
        productImageView.contentMode = .scaleAspectFill
        productImageView.clipsToBounds = true
        productImageView.layer.cornerRadius = 8
        
        let iconSize = screenWidth * 0.08
        let config = UIImage.SymbolConfiguration(pointSize: iconSize, weight: .light)
        productImageView.image = UIImage(systemName: "photo", withConfiguration: config)
        productImageView.tintColor = .systemGray3
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(productImageView)
    }
    
    private func setupLables() {
        titleLabel.font = UIFont.systemFont(ofSize: screenWidth * 0.04, weight: .medium)
        titleLabel.textColor = .label
        titleLabel.numberOfLines = 2
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        locationLabel.font = UIFont.systemFont(ofSize: screenWidth * 0.035, weight: .regular)
        locationLabel.textColor = .systemGray
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        priceLabel.font = UIFont.systemFont(ofSize: screenWidth * 0.045, weight: .bold)
        priceLabel.textColor = .label
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(locationLabel)
        contentView.addSubview(priceLabel)
    }
    
    private func setupBottomIcons() {
        commentIcon.image = UIImage(systemName: "message")
        commentIcon.tintColor = .systemGray
        commentIcon.contentMode = .scaleAspectFit
        commentIcon.translatesAutoresizingMaskIntoConstraints = false
        
        commentLabel.font = UIFont.systemFont(ofSize: screenWidth * 0.03, weight: .regular)
        commentLabel.textColor = .systemGray
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        likeIcon.image = UIImage(systemName: "heart")
        likeIcon.tintColor = .systemGray
        likeIcon.contentMode = .scaleAspectFit
        likeIcon.translatesAutoresizingMaskIntoConstraints = false
        
        likeLabel.font = UIFont.systemFont(ofSize: screenWidth * 0.03, weight: .regular)
        likeLabel.
    }
}
