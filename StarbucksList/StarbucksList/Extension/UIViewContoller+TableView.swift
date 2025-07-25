//
//  UIViewContoller+TableVIew.swift
//  StarbucksList
//
//  Created by 정강우 on 7/25/25.
//

import UIKit

extension UIViewController {
    func setupMenuTableView() {
        let tableView = UITableView()
        let dataSource = MenuTableViewDataSource()

        if let viewController = self as? ViewController {
              viewController.menuDataSource = dataSource
          }
        
        dataSource.tableView = tableView
        
        objc_setAssociatedObject(self, "menuDataSource", dataSource, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        
        // 중요: TableView에 tag 설정
        tableView.tag = 999
        
        tableView.dataSource = dataSource
        tableView.register(MenuListTableViewCell.self, forCellReuseIdentifier: MenuListTableViewCell.identifier)
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = .systemBackground
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        if let customNavBar = view.subviews.compactMap({ $0 as? CustomNavigationBar }).first,
           let storeBar = view.subviews.compactMap({ $0 as? StoreBar }).first {
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: customNavBar.bottomAnchor),  // NavigationBar 아래
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                tableView.bottomAnchor.constraint(equalTo: storeBar.topAnchor)  // StoreBar 위
            ])
        }
    }
    
    func getMenuTableView() -> UITableView? {
        return view.subviews.first { $0.tag == 999 } as? UITableView
    }
    
    // DataSource 접근 메서드 추가
    func getMenuDataSource() -> MenuTableViewDataSource? {
        return objc_getAssociatedObject(self, "menuDataSource") as? MenuTableViewDataSource
    }
}
