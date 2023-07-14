//
//  CategoryService.swift
//  DodoApp
//
//  Created by Искандер Ситдиков on 14.07.2023.
//

import Foundation

class CategoryService {
    
    var catergories = [Category(name: "Пицца"),
                       Category(name: "Комбо"),
                       Category(name: "Коктейли"),
                       Category(name: "Кофе"),
                       Category(name: "Закуски"),
                       Category(name: "Десерты")]
    
    
    func fetch() -> [Category] {
        return catergories
    }
    
}
