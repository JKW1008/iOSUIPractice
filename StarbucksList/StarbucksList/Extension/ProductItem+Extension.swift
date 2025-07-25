//
//  ProductItem+Extension.swift
//  StarbucksList
//
//  Created by 정강우 on 7/25/25.
//

import UIKit

extension ProductItem {
    static func createSampleMenuData() -> [ProductItem] {
        return [
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
            ),
            ProductItem(
                id: "decaf_americano",
                name: "아이스 디카페인 카페 아메리카노",
                englishName: "Iced DECAF Caffe Americano",
                price: 4800,
                imageName: "americano",
                statusBadge: .best,
                hasHotIcon: false
            ),
            // 추가 데이터들
            ProductItem(
                id: "vanilla_latte_initial",
                name: "바닐라 라떼 (초기)",
                englishName: "Vanilla Latte (Initial)",
                price: 5400,
                imageName: "vanilla_latte",
                statusBadge: nil,
                hasHotIcon: false
            ),
            ProductItem(
                id: "americano_initial",
                name: "아메리카노 (초기)",
                englishName: "Americano (Initial)",
                price: 4100,
                imageName: "americano",
                statusBadge: nil,
                hasHotIcon: false
            )
        ]
    }
    static func createMoreMenuData() -> [ProductItem] {
        return [
            ProductItem(
                id: "vanilla_latte",
                name: "바닐라 라떼",
                englishName: "Vanilla Latte",
                price: 5400,
                imageName: "vanilla_latte",
                statusBadge: nil,
                hasHotIcon: false
            ),
            ProductItem(
                id: "cold_brew",
                name: "콜드 브루",
                englishName: "Cold Brew",
                price: 4500,
                imageName: "cold_brew",
                statusBadge: .best,
                hasHotIcon: false
            ),
            ProductItem(
                id: "caramel_macchiato",
                name: "카라멜 마키아또",
                englishName: "Caramel Macchiato",
                price: 5900,
                imageName: "caramel_macchiato",
                statusBadge: nil,
                hasHotIcon: true
            ),
            ProductItem(
                id: "green_tea_latte",
                name: "그린 티 라떼",
                englishName: "Green Tea Latte",
                price: 5700,
                imageName: "green_tea_latte",
                statusBadge: nil,
                hasHotIcon: true
            ),
            ProductItem(
                id: "espresso",
                name: "에스프레소",
                englishName: "Espresso",
                price: 4100,
                imageName: "espresso",
                statusBadge: nil,
                hasHotIcon: true
            ),
            ProductItem(
                id: "java_chip",
                name: "자바 칩 프라푸치노",
                englishName: "Java Chip Frappuccino",
                price: 6300,
                imageName: "java_chip",
                statusBadge: .best,
                hasHotIcon: false
            ),
            ProductItem(
                id: "hazelnut_americano",
                name: "헤이즐넛 아메리카노",
                englishName: "Hazelnut Americano",
                price: 5000,
                imageName: "hazelnut_americano",
                statusBadge: nil,
                hasHotIcon: false
            ),
            ProductItem(
                id: "choco_blended",
                name: "초콜릿 크림칩 블렌디드",
                englishName: "Chocolate Cream Chip Blended",
                price: 6200,
                imageName: "choco_blended",
                statusBadge: .new,
                hasHotIcon: false
            ),
            ProductItem(
                id: "mint_coldbrew",
                name: "민트 콜드 브루",
                englishName: "Mint Cold Brew",
                price: 5800,
                imageName: "mint_coldbrew",
                statusBadge: .new,
                hasHotIcon: false
            ),
            ProductItem(
                id: "honey_black_tea",
                name: "허니 블랙 티",
                englishName: "Honey Black Tea",
                price: 5500,
                imageName: "honey_black_tea",
                statusBadge: nil,
                hasHotIcon: true
            )
        ]
    }

}
