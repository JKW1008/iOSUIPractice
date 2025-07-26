//
//  ViewController.swift
//  StarbucksList
//
//  Created by 정강우 on 7/19/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    var menuDataSource: MenuTableViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCustomNavigationBar()
        setupMenuBar()
        setupStoreBar()
        setupMenuTableView()  // 여기서 menuDataSource가 설정됨
        
        // setupMenuTableView() 호출 후에 delegate 설정
        if let tableView = getMenuTableView() {
            tableView.delegate = self
            print("🔗 Delegate set, DataSource: \(menuDataSource != nil ? "✅" : "❌")")
        }
        
        setupActions()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height * 0.12
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("선택된 메뉴: \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("👀 Will display cell at row: \(indexPath.row)")
        
        // tableView의 dataSource를 직접 사용
        if let dataSource = tableView.dataSource as? MenuTableViewDataSource {
            print("📊 Current total items: \(dataSource.itemCount)")
            
            if dataSource.shouldLoadMore(for: indexPath) {
                print("🚀 Triggering load more data!")
                dataSource.loadMoreData()
            } else {
                print("⏸️ Not loading more yet (row \(indexPath.row) < \(dataSource.itemCount - 3))")
            }
        } else {
            print("❌ DataSource not found in tableView!")
        }
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
