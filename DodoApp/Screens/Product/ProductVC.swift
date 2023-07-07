//
//  ProductVC.swift
//  DodoApp
//
//  Created by Искандер Ситдиков on 06.07.2023.
//

import UIKit

class ProductVC: UIViewController {
    
    let productService = ProductService()
    
    var product: [Product] = []
    
    lazy var ingredientsColletionView: UICollectionView = {
        let collectionView = UICollectionView()
        
        collectionView.delegate = self
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow
        product = productService.fetch()
    }
    

}


extension ProductVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        product.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "identifire", for: indexPath)
        
        return cell
    }
    
    
}
