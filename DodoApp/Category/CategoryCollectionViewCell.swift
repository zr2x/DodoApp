//
//  CategoryCollectionViewCell.swift
//  DodoApp
//
//  Created by Искандер Ситдиков on 14.07.2023.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifire = "CategoryCollectionViewCell"
    
    var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        view.layer.cornerRadius = 13
        return view
    }()
    
    var categoryButton: UIButton = {
        let categoryButton = UIButton()
        
        categoryButton.layer.cornerRadius = 20
        categoryButton.backgroundColor = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 0.7)
        return categoryButton
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        categoryButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(categoryButton)
    }
    
    private func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
        categoryButton.snp.makeConstraints { make in
            make.edges.equalTo(containerView)
        }
    }
    
    func update(_ category: Category) {
        categoryButton.setTitle(category.name, for: .normal)
    }
  
    
    @objc private func buttonAction() {
        if categoryButton.isHighlighted {
            
        } else {
            categoryButton.backgroundColor = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 0.7)
        }
    }
}
