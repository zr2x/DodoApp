//
//  ProductTypeCell.swift
//  DodoApp
//
//  Created by Искандер Ситдиков on 30.07.2023.
//

import UIKit

class ProductTypeCell: UITableViewCell {
    
    static let identifire = "ProductTypeCell"
    
    //MARK: UI elements
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
        button.setTitleColor(UIColor(red: 1.0, green: 0.8, blue: 0.6, alpha: 1.0), for: .normal)
        return button
    }()
    
    
    //MARK: init
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
    
    //MARK: add subviews
    private func setupViews() {
        contentView.addSubview(pizzaImageView)

        contentView.addSubview(pizzaNameLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(removeIngridientsButton)
    }
    
    //MARK: constraints
    private func setupConstraints() {
        pizzaImageView.snp.makeConstraints { make in
            make.left.right.equalTo(contentView)
            make.top.equalTo(contentView).inset(10)
            make.width.height.equalTo(300)
        }
    
        pizzaNameLabel.snp.makeConstraints { make in
            make.top.equalTo(pizzaImageView.snp.bottom).inset(6)
            make.left.equalTo(contentView).offset(30)
            make.right.equalTo(contentView).inset(30)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(pizzaNameLabel.snp.bottom).offset(6)
            make.left.equalTo(contentView).offset(30)
            make.right.equalTo(contentView).inset(30)

        }
        
        removeIngridientsButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(6)
            make.left.equalTo(contentView).offset(30)
            make.width.equalTo(180)
            make.height.equalTo(20)
        }
    }
    
    //MARK: update method
    func update(_ product: Product) {
        pizzaImageView.image = UIImage(named: product.image)
        pizzaNameLabel.text = product.name
        descriptionLabel.text = product.detail
    }
    
    
}
