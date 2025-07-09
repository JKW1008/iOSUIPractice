//
//  ViewController.swift
//  CarrotList
//
//  Created by 정강우 on 7/8/25.
//

import UIKit

class ViewController: UIViewController {
    private var customNavigationBar = CustomNavigationBar()
    private var customHomeBar = CustomHomeBar()
    private var tableView = UITableView()
    private var products: [ProductItem] = []
    private var isLoading = false // 이것도 추가
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(true, animated: false)
        
        setupCustomNavigationBar()
        setupCustomHomeBar()
        setupTableView()
        loadInitialProducts() // loadProducts() 대신 이걸로 변경
    }
    
    private func setupUI() {
        
    }

    private func setupCustomNavigationBar() {
        view.addSubview(customNavigationBar)
        
        NSLayoutConstraint.activate([
            customNavigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            customNavigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customNavigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .systemBackground
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: customNavigationBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: customHomeBar.topAnchor)
        ])
    }
    
    private func setupCustomHomeBar() {
        view.addSubview(customHomeBar)
        
        NSLayoutConstraint.activate([
            customHomeBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            customHomeBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customHomeBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customHomeBar.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.08) 
        ])
    }
    
    // 여기에 추가
    private func loadInitialProducts() {
        products = ProductTableViewCell.createDummyData()
        tableView.reloadData()
    }
    
    // 여기에 추가
    private func loadMoreProducts() {
        guard !isLoading else { return }
        
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            guard let self = self else { return }
            
            let newProducts = ProductTableViewCell.createMoreDummyData()
            self.products.append(contentsOf: newProducts)
            
            let startIndex = self.products.count - newProducts.count
            let endIndex = self.products.count - 1
            let newIndexPaths = (startIndex...endIndex).map { IndexPath(row: $0, section: 0) }
            
            self.tableView.insertRows(at: newIndexPaths, with: .none)
            self.isLoading = false
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as! ProductTableViewCell
        cell.configure(with: products[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("선택된 상품: \(products[indexPath.row].title)")
    }
    
    // 여기에 추가
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height - 100 {
            loadMoreProducts()
        }
    }
}
