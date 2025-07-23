import UIKit

extension UIViewController {
    func setupStoreBar() {
        let customStoreBar = StoreBar()
        
        customStoreBar.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(customStoreBar)
        
        // MenuBar 찾기 (이미 추가되어 있다고 가정)
        if let menuBar = view.subviews.compactMap({ $0 as? MenuBar }).first {
            NSLayoutConstraint.activate([
                customStoreBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                customStoreBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                customStoreBar.bottomAnchor.constraint(equalTo: menuBar.topAnchor)
            ])
        } else {
            // MenuBar가 없으면 safeArea 바로 위에 배치
            NSLayoutConstraint.activate([
                customStoreBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                customStoreBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                customStoreBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        }
    }
    
    // StoreBar 설정을 위한 헬퍼 메서드들
    func setStoreName(_ name: String) {
        if let storeBar = view.subviews.compactMap({ $0 as? StoreBar }).first {
            storeBar.setStoreName(name)
        }
    }
    
    func setCartCount(_ count: Int) {
        if let storeBar = view.subviews.compactMap({ $0 as? StoreBar }).first {
            storeBar.setCartCount(count)
        }
    }
    
    func setStoreSelectionAction(_ action: @escaping () -> Void) {
        if let storeBar = view.subviews.compactMap({ $0 as? StoreBar }).first {
            storeBar.setStoreSelectionAction(action)
        }
    }
    
    func setCartAction(_ action: @escaping () -> Void) {
        if let storeBar = view.subviews.compactMap({ $0 as? StoreBar }).first {
            storeBar.setCartAction(action)
        }
    }
}
