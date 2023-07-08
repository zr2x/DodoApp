//
//  BannerCell.swift
//  DodoApp
//
//  Created by Искандер Ситдиков on 07.07.2023.
//

import UIKit

class BannerCell: UITableViewCell {
    
    static let identifire = "BannerCell"
    
    var bannerView: UIView = {
        let bannerView = UIView()
        bannerView.backgroundColor = .orange
        return bannerView
    }()
    
    var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Выгодно и вкусно"
        titleLabel.font = .boldSystemFont(ofSize: 20)
        return titleLabel
    }()
    
    lazy var bannerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width * 0.65, height: UIScreen.main.bounds.width * 0.25)
        let bannerCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        bannerCollectionView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: BannerCollectionViewCell.identifire)
        return bannerCollectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(bannerView)
        bannerView.addSubview(titleLabel)
    }
    
    private func setupConstraints() {
        bannerView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
            make.height.width.equalTo(150)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.top.right.equalTo(bannerView).inset(16)
        }
        
    }
    
}


extension BannerCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.identifire, for: indexPath) as? BannerCollectionViewCell else { return UICollectionViewCell() }
        return cell
            
    }
    
    
}
