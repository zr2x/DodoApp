//
//  ViewController.swift
//  DodoApp
//
//  Created by Искандер Ситдиков on 03.07.2023.
//
import UIKit
import SnapKit

class MenuScreenVC: UIViewController {
    
    let productService = ProductService()
    
    var products: [Product] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    //клоужерная инициализация отрабатывает 1 раз (если нужно многократное создание объектов, нужно переписать на функцию
    // смена цвета tableView работает в lazy
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .yellow
        tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.identifire)
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.identifire, for: indexPath) as? ProductCell else { return UITableViewCell() }
        
        let product = products[indexPath.row]

        cell.update(product: product)
        return cell
    }
}
