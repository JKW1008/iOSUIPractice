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
    
    static let identifier = "ProductTableViewCell"
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
        setupProductImageView()  // 함수명 수정
        setupLabels()           // 함수명 수정 (setupLables -> setupLabels)
        setupBottomIcons()
        setupConstraints()
    }
    
    private func setupProductImageView() {
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
    
    private func setupLabels() {
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
        likeLabel.textColor = .systemGray
        likeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(commentIcon)
        contentView.addSubview(commentLabel)
        contentView.addSubview(likeIcon)
        contentView.addSubview(likeLabel)
    }
    
    private func setupConstraints() {
        
        
        let imageSize = screenWidth * 0.25
        let padding = screenWidth * 0.04
        let smallPadding = screenWidth * 0.02
        let verticalSpacing = screenHeight * 0.01
        let iconSize = screenWidth * 0.04
        
        NSLayoutConstraint.activate([
            // 상품 이미지
             productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
             productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
             productImageView.widthAnchor.constraint(equalToConstant: imageSize),
             productImageView.heightAnchor.constraint(equalToConstant: imageSize),
             
             // 제목
             titleLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: padding),
             titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
             titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
             
             // 위치 및 시간
             locationLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
             locationLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
             locationLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: verticalSpacing),
             
             // 가격
             priceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
             priceLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
             priceLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: verticalSpacing),
             
             // 댓글 아이콘
             commentIcon.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
             commentIcon.bottomAnchor.constraint(equalTo: productImageView.bottomAnchor),
             commentIcon.widthAnchor.constraint(equalToConstant: iconSize),
             commentIcon.heightAnchor.constraint(equalToConstant: iconSize),
             
             // 댓글 수
             commentLabel.leadingAnchor.constraint(equalTo: commentIcon.trailingAnchor, constant: smallPadding * 0.5),
             commentLabel.centerYAnchor.constraint(equalTo: commentIcon.centerYAnchor),
             
             // 하트 아이콘
             likeIcon.leadingAnchor.constraint(equalTo: commentLabel.trailingAnchor, constant: smallPadding),
             likeIcon.centerYAnchor.constraint(equalTo: commentIcon.centerYAnchor),
             likeIcon.widthAnchor.constraint(equalToConstant: iconSize),
             likeIcon.heightAnchor.constraint(equalToConstant: iconSize),
             
             // 좋아요 수
             likeLabel.leadingAnchor.constraint(equalTo: likeIcon.trailingAnchor, constant: smallPadding * 0.5),
             likeLabel.centerYAnchor.constraint(equalTo: likeIcon.centerYAnchor),
             
             // 셀 높이
             contentView.bottomAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: padding)
        ])
    }
    
    func configure(with item: ProductItem) {
        titleLabel.text = item.title
        locationLabel.text = "\(item.location) · \(item.timeAgo)"
        priceLabel.text = item.price
        commentLabel.text = "\(item.commentCount)"
        likeLabel.text = "\(item.likeCount)"
        
        // 이미지 설정 (SF Symbol 사용)
        let iconSize = screenWidth * 0.08
        let config = UIImage.SymbolConfiguration(pointSize: iconSize, weight: .light)
        productImageView.image = UIImage(systemName: item.image, withConfiguration: config)
    }
}
