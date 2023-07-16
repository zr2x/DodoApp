//
//  ViewController.swift
//  DodoApp
//
//  Created by Искандер Ситдиков on 03.07.2023.
//
import UIKit
import SnapKit

enum MenuSection: Int, CaseIterable {
    case banner
    case category
    case products
}

final class MenuScreenVC: UIViewController {
    
    let productService = ProductService()
    let categoryService = CategoryService()
    
    var products: [Product] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private var categories: [Category] = []
    
    //клоужерная инициализация отрабатывает 1 раз (если нужно многократное создание объектов, нужно переписать на функцию
    // смена цвета tableView работает в lazy
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.identifire)
        tableView.register(BannerCell.self, forCellReuseIdentifier: BannerCell.identifire)
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.identifire)
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
    
    func fetchCategories(categories: [Category]) {
        self.categories = categories
    }
}

extension MenuScreenVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        MenuSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return categories.count
        case 2: return products.count
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = MenuSection(rawValue: indexPath.section)
        switch section {
        case .banner:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BannerCell.identifire, for: indexPath) as? BannerCell else { return UITableViewCell() }
//            cell.update(products)
            return cell
            
        case .products:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.identifire, for: indexPath) as? ProductCell else { return
                UITableViewCell() }
            
            let product = products[indexPath.row]
            cell.update(product: product)
            return cell
            
        case . category:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifire, for: indexPath) as? CategoryTableViewCell else { return UITableViewCell() }
            cell.update(categories)
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
