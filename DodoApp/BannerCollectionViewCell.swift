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
        label.backgroundColor = .black

        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews() {
        contentView.addSubview(descriptionLabel)
    }
    
    private func setupConstraints() {
        descriptionLabel.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
}
