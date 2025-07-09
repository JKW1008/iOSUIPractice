//
//  Product+TableViewCell.swift
//  CarrotList
//
//  Created by 정강우 on 7/9/25.
//

extension ProductTableViewCell {
    static func createDummyData() -> [ProductItem] {
        return [
            ProductItem(image: "photo.fill", title: "암웨이 공기청정기", location: "분당구 운중동", timeAgo: "끌올 50초 전", price: "45,000원", commentCount: 1, likeCount: 5),
            ProductItem(image: "photo.fill", title: "[3회미만사용] 레팩스 폴딩 캠핑 테이블 판매합니다.", location: "광주시 양벌동", timeAgo: "4시간 전", price: "40,000원", commentCount: 1, likeCount: 14),
            ProductItem(image: "photo.fill", title: "자죽3개!!!싱고니움 T25 #무싱X#무니식물", location: "정자동", timeAgo: "끌올 1분 전", price: "15,000원", commentCount: 0, likeCount: 1),
            ProductItem(image: "photo.fill", title: "코베아3종그릴셑트", location: "분당구 삼평동", timeAgo: "2시간 전", price: "40,000원", commentCount: 10, likeCount: 15),
            ProductItem(image: "photo.fill", title: "러셀경의구스살포홀전한방재 에어매트리스", location: "성호동", timeAgo: "끌올 1분 전", price: "15,000원", commentCount: 0, likeCount: 3)
        ]
    }
    
    // 무한 스크롤용 추가 데이터 생성 함수 추가
    static func createMoreDummyData() -> [ProductItem] {
        let additionalProducts = [
            ProductItem(image: "gamecontroller.fill", title: "닌텐도 스위치 라이트", location: "분당구 정자동", timeAgo: "1분 전", price: "180,000원", commentCount: 3, likeCount: 12),
            ProductItem(image: "book.fill", title: "대학교 전공서적 일괄 판매", location: "수지구 동천동", timeAgo: "5분 전", price: "50,000원", commentCount: 2, likeCount: 7),
            ProductItem(image: "bicycle", title: "삼천리 자전거 (거의 새 것)", location: "용인시 기흥구", timeAgo: "10분 전", price: "250,000원", commentCount: 0, likeCount: 3),
            ProductItem(image: "tv.fill", title: "LG 43인치 스마트 TV", location: "분당구 서현동", timeAgo: "15분 전", price: "300,000원", commentCount: 5, likeCount: 20),
            ProductItem(image: "headphones", title: "애플 에어팟 프로 2세대", location: "성남시 중원구", timeAgo: "20분 전", price: "200,000원", commentCount: 8, likeCount: 15)
        ]
        return additionalProducts
    }
}
