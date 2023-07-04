//
//  ServiceProduct.swift
//  DodoApp
//
//  Created by Искандер Ситдиков on 03.07.2023.
//

import Foundation


class ProductService {
    
    let products = [Product(name: "Гавайская", detail: "Тесто, Cыр, Буженина", price: 590, image: "pizza"),
                    Product(name: "Маргарита", detail: "Тесто, Cыр, Колбаска", price: 650, image: "pizza"),
                    Product(name: "Пепперони", detail: "Тесто, Cыр, Перец, Томат, Лук", price: 710, image: "pizza")]
    

    func fetch() -> [Product] {
        return products
    }
}
