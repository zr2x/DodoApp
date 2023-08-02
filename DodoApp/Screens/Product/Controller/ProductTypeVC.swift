//
//  ProductTypeCell.swift
//  DodoApp
//
//  Created by Искандер Ситдиков on 30.07.2023.
//

import UIKit

class ProductTypeVC: UIViewController {
    
    var product: Product?
    
    let productService = ProductService()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        //        tableView.backgroundColor =
        tableView.register(ProductTypeCell.self, forCellReuseIdentifier: ProductTypeCell.identifire)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    let containerView: UIView = {
        let container = UIView()
        container.backgroundColor = .orange
        container.layer.cornerRadius = 10
        return container
    }()
    
    let purchaseButton: UIButton = {
        let button = UIButton()
        button.setTitle("Buy", for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    
    private func setupViews() {
        view.addSubview(tableView)
        view.addSubview(containerView)
        containerView.addSubview(purchaseButton)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.left.right.equalTo(view)
            make.height.equalTo(view.snp.height).multipliedBy(0.5)
            
        }
        
        containerView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(view).inset(10)
            make.height.equalTo(60)
        }
        
        purchaseButton.snp.makeConstraints { make in
            make.edges.equalTo(containerView)
        }
    }
    
}



extension ProductTypeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductTypeCell.identifire, for: indexPath) as? ProductTypeCell else { return UITableViewCell() }
        
        if product != nil {
            cell.update(product!)
        }
        
        return cell
    }
    
    
}
