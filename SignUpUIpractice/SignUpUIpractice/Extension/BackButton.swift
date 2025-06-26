//
//  BackButton.swift
//  SignUpUIpractice
//
//  Created by 정강우 on 6/26/25.
//

import UIKit

extension UIView {
    func addBsackArrow(imageName: String,topSpacingRatio: CGFloat = 0.01, leadingSpacingRatio: CGFloat = 0.05, sizeRatio: CGFloat = 0.08) -> UIImageView {
        let arrowSize = min(self.bounds.width, self.bounds.height) * sizeRatio
        let topSpacing = self.bounds.height * topSpacingRatio
        let leadingSpacing = self.bounds.width * leadingSpacingRatio
        
        let config = UIImage.SymbolConfiguration(pointSize: arrowSize, weight: .light)
        
        let imageView = UIImageView(image: UIImage(systemName: imageName, withConfiguration: config))
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .label
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: topSpacing),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingSpacing),
            imageView.widthAnchor.constraint(equalToConstant: arrowSize),
            imageView.heightAnchor.constraint(equalToConstant: arrowSize)
        ])
        
        return imageView
    }
}
