//
//  UIImage.swift
//  CarrotMarketUI
//
//  Created by 정강우 on 6/25/25.
//

import UIKit

extension UIView {
    func addCenteredImageView(imageName: String, widthMultiplier: CGFloat = 0.4, topOffset: CGFloat = 0.25) -> UIImageView {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(imageView)
        
        guard let image = imageView.image else { return imageView }
        
        let aspectRatio = image.size.height / image.size.width
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: self.bounds.height * topOffset),
            imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: widthMultiplier),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: aspectRatio)
        ])
        
        return imageView
    }
}
