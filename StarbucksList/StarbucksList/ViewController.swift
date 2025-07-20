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
        setBackButtonAction {
            print("뒤로가기 버튼 탭됨")
        }
        setSearchButtonAction {
            print("검색 버튼 탬됨")
        }
    }
}

