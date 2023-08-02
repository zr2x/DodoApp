//
//  ProductVC.swift
//  DodoApp
//
//  Created by Искандер Ситдиков on 06.07.2023.
//

import UIKit

class ProductVC: UIViewController {
    
    let productService = ProductService()
    
    var product: Product?
    
    lazy var ingredientsColletionView: UICollectionView = {
        
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 60, height: 60)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

//        view.backgroundColor = .yellow
    }
}


extension ProductVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "identifire", for: indexPath)
        
        return cell
    }
}
