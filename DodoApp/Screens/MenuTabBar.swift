//
//  MenuTabBar.swift
//  DodoApp
//
//  Created by Искандер Ситдиков on 05.07.2023.
//

import UIKit

class MenuTabBar: UITabBarController {
    
//    lazy var menuVC: MenuScreenVC = {
//        let menuVC = MenuScreenVC()
//        let image = UIImage(systemName: "menucard")
//        let tabBarItem = UITabBarItem(title: "Меню", image: image, selectedImage: image)
//        menuVC.tabBarItem = tabBarItem
//        return menuVC
//    }()
    
//    lazy var proficeVC: ProfileVC = {
//        let proficeVC = ProfileVC()
//
//        return proficeVC
//    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        

        
//        view.backgroundColor = .white
        
    }
    
    
    //MARK: Setup TabBar
    private func setupTabBar() {
        
        let menu = createNavControllers(with: "Меню", and: UIImage(systemName: "fork.knife.circle.fill"), vc: MenuScreenVC())
        let profile = createNavControllers(with: "Профиль", and: UIImage(systemName: "person.crop.circle.fill"), vc: ProfileVC())
        let cart = createNavControllers(with: "Корзина", and: UIImage(systemName: "cart.circle.fill"), vc: CartVC())
                             
        
        self.setViewControllers([menu, profile, cart], animated: true)
        view.backgroundColor = .white
        
        self.tabBar.barTintColor = .systemBlue // окраска самого tabBar
        self.tabBar.tintColor = .orange // окраска кнопок
    }
    
    private func createNavControllers(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let navController = UINavigationController(rootViewController: vc)
        
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
//        rootViewController.navigationItem.title = title
        return navController
    }
}
