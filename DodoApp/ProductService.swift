//
//  ServiceProduct.swift
//  DodoApp
//
//  Created by Искандер Ситдиков on 03.07.2023.
//

import Foundation


class ProductService {
    
    let products = [Product(name: "Аррива", detail: "Тесто, Cыр, Буженина", price: 590, image: "аррива"),
                    Product(name: "Маргарита", detail: "Тесто, Cыр, Колбаска", price: 650, image: "маргарита"),
                    Product(name: "Барбекю", detail: "Тесто, Cыр, Перец, Томат, Лук", price:410, image: "барбекю"), Product(name: "Домашняя", detail: "Тесто, Cыр, Буженина", price: 340, image: "домашняя"), Product(name: "Карбонара", detail: "Тесто, Cыр, Буженина", price: 520, image: "карбонара"),Product(name: "Карри", detail: "Тесто, Cыр, Ананас, Курица", price: 545, image: "карри"),Product(name: "Чикен-Ранч", detail: "Тесто, Cыр, Буженина", price: 590, image: "чикен-ранч"), Product(name: "Ветчина-грибы", detail: "Тесто, Cыр, Буженина", price: 590, image: "ветчина-грибы"), Product(name: "Ассорти", detail: "Тесто, Cыр, Буженина", price: 590, image: "ассорти")]
    

    func fetch() -> [Product] {
        return products
    }
}
