//
//  AppDelegate.swift
//  HammerSys_testTask
//
//  Created by Sergei Kornilov on 12/01/2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let tabBarController = UITabBarController()
        
        // Создаем ViewController
        func createMenuViewController() -> UINavigationController {
            let menuViewController = MenuViewController()
            menuViewController.tabBarItem = UITabBarItem(title: "Меню", image: UIImage(named: "icon-menu"), tag: 0)
            return UINavigationController(rootViewController: menuViewController)
        }
        
        // Создаем ViewController
        func createContactsViewController() -> UINavigationController {
            let contactsViewController = ContactsViewController()
            contactsViewController.tabBarItem = UITabBarItem(title: "Контакты", image: UIImage(named: "icon-contact"), tag: 0)
            return UINavigationController(rootViewController: contactsViewController)
        }
        
        // Создаем ViewController
        func createProfileViewController() -> UINavigationController {
            let profileViewController = ProfileViewController()
            profileViewController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(named: "icon-profile"), tag: 0)
            return UINavigationController(rootViewController: profileViewController)
        }
        
        // Создаем ViewController
        func createCartViewController() -> UINavigationController {
            let cartViewController = CartViewController()
            cartViewController.tabBarItem = UITabBarItem(title: "Корзина", image: UIImage(named: "icon-cart"), tag: 0)
            
            return UINavigationController(rootViewController: cartViewController)
        }
        
        // Создаем TabBarController и добавляем в него 4 ViewController
        func createTabBarController() -> UITabBarController {
            UITabBar.appearance().backgroundColor = .white
            let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)]
            UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .normal)
            UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .selected)
            
            tabBarController.tabBar.tintColor = UIColor.cRed
            tabBarController.tabBar.unselectedItemTintColor = UIColor.cLightGrey
            
            tabBarController.viewControllers = [createMenuViewController(), createContactsViewController(), createProfileViewController(), createCartViewController()]
            return tabBarController
        }
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = createTabBarController()
        window?.makeKeyAndVisible()
        
        return true
    }
    
    
    
    
}

