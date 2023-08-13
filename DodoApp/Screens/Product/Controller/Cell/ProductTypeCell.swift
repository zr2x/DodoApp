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
    
    private lazy var downButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = layer.frame.height / 2
        button.clipsToBounds = true
        return button
    }()
    
    private let pizzaImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let pizzaNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let removeIngridientsButton: UIButton = {
        let button = UIButton()
        button.sizeToFit()
        button.setTitle("убрать ингридиенты", for: .normal)
        button.setTitleColor(UIColor(red: 1.0, green: 0.8, blue: 0.6, alpha: 1.0), for: .normal)
        return button
    }()
    
    private let sizeTitles = ["Маленькая", "Средняя", "Большая"]
    
    private lazy var sizeSegment: UISegmentedControl = {
        let segment = UISegmentedControl(items: sizeTitles)
        segment.selectedSegmentIndex = 2
        segment.addTarget(self, action: #selector(segmentAction), for: .valueChanged)
        return segment
    }()
    
    private let doughTitles = ["Традицинное", "Тонкое"]
    
    private lazy var doughTypeSegment: UISegmentedControl = {
        let segment = UISegmentedControl(items: doughTitles)
        segment.selectedSegmentIndex = 1
        return segment
    }()
    //MARK: init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        downButton.addTarget(self, action: #selector(dissMissAction), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    //MARK: add subviews
    private func setupViews() {
        contentView.addSubview(downButton)
        contentView.addSubview(pizzaImageView)
        contentView.addSubview(pizzaNameLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(removeIngridientsButton)
        contentView.addSubview(sizeSegment)
        contentView.addSubview(doughTypeSegment)
    }
    
    //MARK: constraints
    private func setupConstraints() {
        
        downButton.snp.makeConstraints { make in
            make.left.top.equalTo(contentView.safeAreaLayoutGuide).inset(15)
            make.width.height.equalTo(45)
        }
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
            make.height.equalTo(20)
        }
        
        sizeSegment.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(30)
            make.right.equalTo(contentView).inset(30)
            make.top.equalTo(removeIngridientsButton.snp.bottom).offset(8)
        }
        
        doughTypeSegment.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(30)
            make.right.equalTo(contentView).inset(30)
            make.top.equalTo(sizeSegment.snp.bottom).offset(8)
        }
    }
    
    //MARK: update method
    func update(_ product: Product) {
        pizzaImageView.image = UIImage(named: product.image)
        pizzaNameLabel.text = product.name
        descriptionLabel.text = product.detail
    }
    
    @objc func segmentAction() {
        
    }
    
    @objc private func dissMissAction() {
        self.resignFirstResponder()
    }
    
}
