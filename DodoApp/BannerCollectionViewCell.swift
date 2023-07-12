//
//  BannerCollectionViewCell.swift
//  DodoApp
//
//  Created by Искандер Ситдиков on 08.07.2023.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    
    static let identifire = "BannerCollectionViewCell"
    
    //    private var descriptionLabel: UILabel = {
    //        let label = UILabel()
    //        label.text = "Вкусно и выгодно"
    //        label.font = .boldSystemFont(ofSize: 20)
    //        label.backgroundColor = .red
    //        label.textAlignment = .center
    //        return label
    //    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "пепперони фреш"
        label.numberOfLines = 0
        return label
    }()
    
    private var productImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "pizza")
        image.contentMode = .scaleToFill
        return image
    }()
    
    private var priceButton: UIButton = {
        let button = UIButton()
        button.setTitle("от 219 руб", for: .normal)
        button.backgroundColor = .orange.withAlphaComponent(0.3)
        return button
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
        contentView.addSubview(productImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceButton)
        contentView.backgroundColor = .lightGray
    }
    
    private func setupConstraints() {
        
        productImage.snp.makeConstraints { make in
            make.left.equalTo(contentView).inset(5)
            make.top.equalTo(contentView).offset(8)
            make.width.height.equalTo(85)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(10)
            make.left.equalTo(productImage.snp.right).offset(10)
            
        }
        
        priceButton.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(18)
            make.left.equalTo(nameLabel)
        }
        
         
        
    }
    
    func update(_ product: Product) {
        priceButton.setTitle("от\(product.price) руб", for: .normal)
        nameLabel.text = product.name
        productImage.image = UIImage(named: product.image)
        
    }
}
