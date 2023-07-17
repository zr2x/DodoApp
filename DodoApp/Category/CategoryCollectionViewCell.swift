//
//  CategoryCollectionViewCell.swift
//  DodoApp
//
//  Created by Искандер Ситдиков on 14.07.2023.
//

import UIKit
import Dispatch
class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifire = "CategoryCollectionViewCell"
    
    var containerView: UIView = {
        let view = UIView()

        return view
    }()
    
    var categoryButton: UIButton = {
        let categoryButton = UIButton()
        categoryButton.backgroundColor = .lightGray
        return categoryButton
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        
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
}
