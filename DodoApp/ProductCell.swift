//
//  ProductCell.swift
//  DodoApp
//
//  Created by Искандер Ситдиков on 03.07.2023.
//

import UIKit

class ProductCell: UITableViewCell {
    
    static let identifire = "ProductCell"
    
    var productLabel: UILabel = {
        let label = UILabel()
        label.text = "Test"
        return label
    }()
    
    var pizzaImageView: UIImageView = {
        let pizzaImageView = UIImageView()
        
        return pizzaImageView
    }()
    
    var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()

        return descriptionLabel
    }()
    
    var buyButton: UIButton = {
        let buyButton = UIButton()
        
        return buyButton
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func update(product: Product) {
        buyButton.setTitle("\(product.price)", for: .normal)
        productLabel.text = product.name
        descriptionLabel.text = product.detail
        pizzaImageView.image = UIImage(named: product.image)
        
    }
    
    func setupViews() {
        contentView.addSubview(productLabel)
        contentView.addSubview(pizzaImageView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(buyButton)

    }
    
    func setupConstraints() {
        
        pizzaImageView.snp.makeConstraints { make in
            make.left.top.bottom.equalTo(contentView).inset(20)
            make.width.height.equalTo(150)
        }
        productLabel.snp.makeConstraints { make in
            make.left.equalTo(pizzaImageView.snp.right).offset(20)
            make.top.right.equalTo(contentView).inset(20)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(productLabel.snp.bottom).offset(20)
            make.left.equalTo(pizzaImageView.snp.right).offset(20)
            make.right.equalTo(contentView).inset(20)
        }
        
        buyButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).inset(20)
            make.left.equalTo(pizzaImageView.snp.right).inset(20)
            make.bottom.equalTo(contentView.snp.bottom).inset(20)
        }
    }
}
