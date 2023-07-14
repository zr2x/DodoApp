//
//  ViewController.swift
//  DodoApp
//
//  Created by Искандер Ситдиков on 03.07.2023.
//
import UIKit
import SnapKit

final class MenuScreenVC: UIViewController {
    
    let productService = ProductService()
    let categoryService = CategoryService()
    
    var products: [Product] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private var category: [Category] = []
    
    //клоужерная инициализация отрабатывает 1 раз (если нужно многократное создание объектов, нужно переписать на функцию
    // смена цвета tableView работает в lazy
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.identifire)
        tableView.register(BannerCell.self, forCellReuseIdentifier: BannerCell.identifire)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        
        fetchProducts()
    }
    
    
    private func setupViews() {
        
        view.addSubview(tableView)
        
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func fetchProducts() {
        products = productService.fetch()
    }
}

extension MenuScreenVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return products.count
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BannerCell.identifire, for: indexPath) as? BannerCell else { return UITableViewCell() }
//            cell.update(products)
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.identifire, for: indexPath) as? ProductCell else { return
                UITableViewCell() }
            
            let product = products[indexPath.row]
            cell.update(product: product)
            return cell
        default:
            return UITableViewCell()
        }
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRow = products[indexPath.row]
        
        let productVC = ProductVC()
//        productVC.productService.products = selectedRow
        present(productVC, animated: true)
    }
}
