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
//        bannerView.con
        return bannerView
    }()
    
    var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Выгодно и вкусно"
        titleLabel.font = .boldSystemFont(ofSize: 15)
        return titleLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
