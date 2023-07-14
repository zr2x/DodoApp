//
//  CategoryCollectionViewCell.swift
//  DodoApp
//
//  Created by Искандер Ситдиков on 14.07.2023.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    
    static let identifire = "CategoryTableViewCell"
    
    
    var container: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 40).isActive = true
        //        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 13
        return view
    }()
    
    var categoryButton: UIButton = {
        let categoryButton = UIButton()
        categoryButton.backgroundColor = .lightGray
        return categoryButton
    }()
    
    func update(_ category: Category) {
        categoryButton.setTitle(category.name, for: .normal)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(container)
        container.addSubview(categoryButton)
    }
    
    private func setupConstraints() {
        container.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
        categoryButton.snp.makeConstraints { make in
            make.top.bottom.equalTo(container)
            make.height.equalTo(35)
            make.width.equalTo(60)
        }
    }
}
