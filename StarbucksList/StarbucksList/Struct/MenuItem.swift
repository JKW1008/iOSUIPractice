//
//  MenuItem.swift
//  StarbucksList
//
//  Created by 정강우 on 7/23/25.
//

import UIKit

struct ProductItem{
    let id: String
    let name: String
    let englishName: String
    let price: Int
    let imageName: String
    
    let statusBadge: StatusBadge?
    let hasHotIcon: Bool
    
    var formattedPrice: String {
        return "\(price.formatted())원"
    }
}

enum StatusBadge: String {
    case new = "New"
    case best = "Best"
    
    var backgroundColor: UIColor {
        switch self {
            case .new:
                return .systemGreen
            case .best:
                return .systemRed
        }
    }
}
