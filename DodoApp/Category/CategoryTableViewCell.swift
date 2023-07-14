//
//  CategoryCollectionViewCell.swift
//  DodoApp
//
//  Created by Искандер Ситдиков on 14.07.2023.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    
    static let identifire = "CategoryTableViewCell"
    
    var categories: [Category] = []
    
    
    var containerView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    

    
    
   
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
  
}

extension CategoryTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
    }
    
    
}
