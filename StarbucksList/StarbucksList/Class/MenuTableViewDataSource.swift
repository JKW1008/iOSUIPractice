//
//  MenuTableViewDataSource.swift
//  StarbucksList
//
//  Created by 정강우 on 7/23/25.
//

import UIKit

class MenuTableViewDataSource: NSObject, UITableViewDataSource {
    private var menuItems: [ProductItem] = []
    
    override init() {
        super.init()
        loadSampleData()
    }
    
    private func loadSampleData() {
        menuItems = [
            ProductItem(
                id: "purple_sour_blended",
                name: "퍼플 사워 블렌디드",
                englishName: "Purple Sour Blended",
                price: 6300,
                imageName: "purple_drink",
                statusBadge: .new,
                hasHotIcon: true
            ),
            ProductItem(
                id: "coffee_drawing_matcha",
                name: "커피 드로잉 말차 프라푸치노",
                englishName: "Coffee Drawing Matcha Frappuccino",
                price: 6300,
                imageName: "matcha_drink",
                statusBadge: .new,
                hasHotIcon: true
            ),
            
            ProductItem(
                id: "dolce_latte",
                name: "아이스 스타벅스 돌체 라떼",
                englishName: "Iced Starbucks Dolce Latte",
                price: 5900,
                imageName: "dolce_latte",
                statusBadge: nil,
                hasHotIcon: false
            ),
            
            ProductItem(
                id: "strawberry_yogurt",
                name: "딸기 딜라이트 요거트 블렌디드",
                englishName: "Strawberry Delight Yogurt Blended",
                price: 6300,
                imageName: "strawberry_drink",
                statusBadge: .best,
                hasHotIcon: true
            ),
            ProductItem(
                id: "decaf_americano",
                name: "아이스 디카페인 카페 아메리카노",
                englishName: "Iced DECAF Caffe Americano",
                price: 4800,
                imageName: "americano",
                statusBadge: .best,
                hasHotIcon: false
            )
        ]
    }
}
