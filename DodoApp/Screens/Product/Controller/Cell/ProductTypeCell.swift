//
//  ProductTypeCell.swift
//  DodoApp
//
//  Created by Искандер Ситдиков on 30.07.2023.
//

import UIKit

class ProductTypeCell: UITableViewCell {
    
    static let identifire = "ProductTypeCell"
    
    let pizzaImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let pizzaNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    let removeIngridientsButton: UIButton = {
        let button = UIButton()
        button.setTitle("убрать ингридиенты", for: .normal)
        return button
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func setupViews() {
        contentView.addSubview(pizzaImageView)
        contentView.addSubview(pizzaNameLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(removeIngridientsButton)
    }
    
    private func setupConstraints() {
        pizzaImageView.snp.makeConstraints { make in
            make.left.right.equalTo(contentView)
            make.top.equalTo(contentView).inset(10)
            make.width.height.equalTo(300)
        }
    
        pizzaNameLabel.snp.makeConstraints { make in
            make.top.equalTo(pizzaImageView.snp.bottom).inset(10)
            make.right.equalTo(contentView)
            make.left.equalTo(contentView).offset(30)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(pizzaNameLabel.snp.bottom).offset(10)
            make.right.equalTo(contentView)
            make.left.equalTo(contentView).offset(30)
        }
        
        removeIngridientsButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).inset(10)
            make.right.equalTo(contentView)
            make.left.equalTo(contentView).offset(30)
        }
    }
    
    func update(_ product: Product) {
        pizzaImageView.image = UIImage(named: product.image)
        pizzaNameLabel.text = product.name
        descriptionLabel.text = product.detail
    }
}
