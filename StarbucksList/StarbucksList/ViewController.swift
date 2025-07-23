//
//  ViewController.swift
//  StarbucksList
//
//  Created by 정강우 on 7/19/25.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCustomNavigationBar()
        setupMenuBar()
        setupStoreBar() // 새로 추가!
        
        setupActions()
    }
    
    private func setupActions() {
        // 네비게이션 액션
        setBackButtonAction {
            print("뒤로가기 버튼 탭됨")
        }
        
        setSearchButtonAction {
            print("검색 버튼 탭됨")
        }
        
        // 스토어바 액션
        setStoreSelectionAction {
            print("매장 선택 탭됨")
        }
        
        setCartAction {
            print("장바구니 탭됨")
        }
        
        // 초기값 설정
        setCartCount(0)
        setStoreName("") // 기본 텍스트
    }
}
