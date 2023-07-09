//
//  BannerCollectionViewCell.swift
//  DodoApp
//
//  Created by Искандер Ситдиков on 08.07.2023.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    
    static let identifire = "BannerCollectionViewCell"
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Вкусно и выгодно"
        label.font = .boldSystemFont(ofSize: 20)
        label.backgroundColor = .red
        label.textAlignment = .center
        return label
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
        contentView.addSubview(descriptionLabel)
        
    }
    
    private func setupConstraints() {
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(5)
            make.left.right.bottom.equalTo(contentView)
            
        }
    }
}
