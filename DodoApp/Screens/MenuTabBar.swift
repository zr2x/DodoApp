//
//  MenuTabBar.swift
//  DodoApp
//
//  Created by Искандер Ситдиков on 05.07.2023.
//

import UIKit

class MenuTabBar: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
 
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        tabBar.tintColor = .lightGray
    }

    //MARK: Setup TabBar
    private func setupTabBar() {
        
        let menu = createNavControllers(with: "Меню", and: UIImage(systemName: "fork.knife.circle.fill"), vc: MenuScreenVC())
        let profile = createNavControllers(with: "Профиль", and: UIImage(systemName: "person.crop.circle.fill"), vc: ProfileVC())
        let cart = createNavControllers(with: "Корзина", and: UIImage(systemName: "cart.circle.fill"), vc: CartVC())
                             
        
        self.setViewControllers([menu, profile, cart], animated: true)
        view.backgroundColor = .white
        
        self.tabBar.barTintColor = .lightGray // окраска самого tabBar
        self.tabBar.tintColor = .orange // окраска кнопок
    }
    
    private func createNavControllers(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.viewControllers.first?.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Москва", style: .plain, target: nil, action: #selector(cityAction))
        navController.viewControllers.first?.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: nil, action: #selector(searchAction))
        return navController
    }
    
    @objc func cityAction() {
        let message = "Москва\nКазань"
        let allert = UIAlertController(title: "Выберите ваш город", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Выбрать", style: .default)
        allert.addAction(action)
        present(allert, animated: true)
    }
    
    @objc private func searchAction() {
        
    }
}
