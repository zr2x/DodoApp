//
//  ProductTypeCell.swift
//  DodoApp
//
//  Created by Искандер Ситдиков on 30.07.2023.
//

import UIKit

class ProductTypeCell: UITableViewCell {
    
    let pizzaImage: UIView = {
        let image = UIView()
        
        return image
    }()
    
    let pizzaNameLabel: UILabel = {
        let label = UILabel()
        
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
        contentView.addSubview(pizzaImage)
        contentView.addSubview(pizzaNameLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(removeIngridientsButton)
    }
    
    private func setupConstraints() {
        
    }
}
