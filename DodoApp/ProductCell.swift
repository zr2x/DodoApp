//
//  ProductCell.swift
//  DodoApp
//
//  Created by Искандер Ситдиков on 03.07.2023.
//

import UIKit

class ProductCell: UITableViewCell {
    
    static let identifire = "ProductCell"
    
    var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var pizzaImageView: UIImageView = {
        let pizzaImageView = UIImageView()
        pizzaImageView.contentMode = .scaleAspectFill
        return pizzaImageView
    }()
    
    var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 0
        return descriptionLabel
    }()
    
    var buyButton: UIButton = {
        let buyButton = UIButton()
        buyButton.backgroundColor = .orange.withAlphaComponent(0.3)
        buyButton.layer.cornerRadius = 10
        return buyButton
    }()
    
    lazy var verticalStackView: UIStackView = {
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 15
        verticalStackView.alignment = .leading
        return verticalStackView
    }()
    
    lazy var horizontalStackView: UIStackView = {
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        return horizontalStackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        buyButton.addTarget(self, action: #selector(buyAction), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func update(product: Product) {
        buyButton.setTitle("\(product.price) ₽", for: .normal)
        nameLabel.text = product.name
        descriptionLabel.text = product.detail
        pizzaImageView.image = UIImage(named: product.image)
        
    }
    
    private func setupViews() {
        contentView.addSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(verticalStackView)
        horizontalStackView.addArrangedSubview(pizzaImageView)
        verticalStackView.addArrangedSubview(nameLabel)
        verticalStackView.addArrangedSubview(descriptionLabel)
        verticalStackView.addArrangedSubview(buyButton)
    }
    
    private func setupConstraints() {
        
        horizontalStackView.snp.makeConstraints { make in
            make.left.top.bottom.equalTo(contentView).offset(0)
            make.width.height.equalTo(150)
        }
        
        verticalStackView.snp.makeConstraints { make in
            make.top.right.bottom.equalTo(horizontalStackView).offset(20)
            make.left.equalTo(horizontalStackView.snp.right).offset(20)
        }
        pizzaImageView.snp.makeConstraints { make in
            make.left.top.bottom.equalTo(horizontalStackView).inset(5)
            make.width.height.equalTo(150)
        }
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(pizzaImageView.snp.right).offset(20)
            make.top.right.equalTo(contentView).inset(20)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.left.equalTo(pizzaImageView.snp.right).offset(20)
            make.right.equalTo(contentView).inset(20)
        }

        buyButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(10)
            make.left.equalTo(pizzaImageView.snp.right).offset(20)
            make.bottom.equalTo(contentView.snp.bottom).offset(-20)
            make.width.equalTo(60)
            make.height.equalTo(35)
        }
    }
    
    @objc private func buyAction() {
        
    }
}
