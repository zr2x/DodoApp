//
//  MenuTabBar.swift
//  DodoApp
//
//  Created by Искандер Ситдиков on 05.07.2023.
//

import UIKit

class MenuTabBar: UITabBarController {
    
    lazy var menuVC: MenuScreenVC = {
        let menuVC = MenuScreenVC()
        let image = UIImage(systemName: "menucard")
        let tabBarItem = UITabBarItem(title: "Меню", image: image, selectedImage: image)
        menuVC.tabBarItem = tabBarItem
        return menuVC
    }()
    
    lazy var proficeVC: ProfileVC = {
        let proficeVC = ProfileVC()
        
        return proficeVC
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        viewControllers = [menuVC, proficeVC]
    }
    
    private func setupView() {
        tabBar.tintColor = .orange
        tabBar.backgroundColor = .white
    }
}
