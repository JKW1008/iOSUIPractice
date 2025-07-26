//
//  MenuTableViewDataSource.swift
//  StarbucksList
//
//  Created by 정강우 on 7/23/25.
//

import UIKit

class MenuTableViewDataSource: NSObject, UITableViewDataSource {
    
    private var menuItems: [ProductItem] = ProductItem.createSampleMenuData()
    private var isLoading = false
    
    weak var tableView: UITableView?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("📊 Number of menu items: \(menuItems.count)")
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("🔄 Creating cell for row: \(indexPath.row)")
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuListTableViewCell.identifier, for: indexPath) as? MenuListTableViewCell else {
            return UITableViewCell()
        }
        
        let menuItem = menuItems[indexPath.row]
        cell.configure(with: menuItem)
        return cell
    }
    
    func loadMoreData() {
        guard !isLoading else { return }
        
        isLoading = true
        print("🔄 Loading more data...")
        
        let oldCount = menuItems.count
        
        // 실제 앱에서는 서버에서 데이터를 가져오는 로직
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            guard let self = self else { return }
            
            let newItems = ProductItem.createMoreMenuData()
            self.menuItems.append(contentsOf: newItems)
            self.isLoading = false
            
            print("✅ Loaded \(newItems.count) more items. Total: \(self.menuItems.count)")
            
            // 테이블뷰 업데이트
            let newCount = self.menuItems.count
            let indexPaths = (oldCount..<newCount).map { IndexPath(row: $0, section: 0) }
            
            DispatchQueue.main.async {
                self.tableView?.insertRows(at: indexPaths, with: .fade)
            }
        }
    }
    
    func shouldLoadMore(for indexPath: IndexPath) -> Bool {
        let shouldLoad = indexPath.row >= menuItems.count - 3
        if shouldLoad {
            print("🚀 Should load more at row: \(indexPath.row), total items: \(menuItems.count)")
        }
        return shouldLoad
    }
    
    var itemCount: Int {
        return menuItems.count
    }
}
