//
//  HomeTabBarCoordinator.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 02/05/2023.
//

import Foundation
import UIKit

class HomeTabBarCoordinator:Coordinator {
    var child: [Coordinator]?
    var navigationController: UINavigationController
    var tabBarDelegate:TabBarDelegate!
    
    init(navigationController:UINavigationController){
        self.child = []
        self.navigationController = navigationController
    }
    
    func start() {
        let homeCoordinator = HomeCoordinaor(navigationController: UINavigationController(),tabBarDelegate: tabBarDelegate!)
        homeCoordinator.start()
        child!.append(homeCoordinator)
        homeCoordinator.navigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "basketball.circle.fill"), tag: 0)
        
        let favouriteCoordinator = FavouriteCoordinator(navigationController: UINavigationController(),tabBarDelegate: tabBarDelegate!)
        favouriteCoordinator.start()
        child?.append(favouriteCoordinator)
        favouriteCoordinator.navigationController.tabBarItem = UITabBarItem(title: "Favourite", image: UIImage(systemName: "flag.2.crossed.circle.fill"), tag: 1)
    }
    
    func setTabBarViewControllers( viewControllers: inout [UIViewController]?){
        var viewControllerList:[UIViewController] = []
        child?.forEach({ Coordinator in
            viewControllerList.append(Coordinator.navigationController)
        })
        viewControllers = viewControllerList
    }
    
 
    
}
