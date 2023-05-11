//
//  HomeViewController.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 02/05/2023.
//

import UIKit

class HomeTabBarViewController: UITabBarController,Storyboarded,TabBarDelegate {
    func backShow() {
        tabBar.isHidden = false
    }
    
    func navigateAndHidden() {
        tabBar.isHidden = true
    }
    
    private let homeCoordinator = HomeTabBarCoordinator(navigationController: UINavigationController())

    override func viewDidLoad() {
        super.viewDidLoad()
        homeCoordinator.tabBarDelegate = self
        homeCoordinator.start()
        homeCoordinator.setTabBarViewControllers(viewControllers: &viewControllers)
        initView()
    }

    
    
    private func initView(){
        tabBar.tintColor = UIColor.black
        tabBar.unselectedItemTintColor = UIColor.lightGray
    }
    


    
    

}
