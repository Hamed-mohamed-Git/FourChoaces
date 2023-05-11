//
//  FavouriteCoordinator.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 02/05/2023.
//

import Foundation
import UIKit

class FavouriteCoordinator:Coordinator {
    var child: [Coordinator]?
    var navigationController: UINavigationController
    var tabBarDelegate:TabBarDelegate!
    
    init(navigationController: UINavigationController, tabBarDelegate: TabBarDelegate!) {
        self.child = []
        self.navigationController = navigationController
        self.tabBarDelegate = tabBarDelegate
    }
    
    func start() {
        let favouriteNavigationController = FavouriteViewController.instantiate()
        favouriteNavigationController.favourieCorrdinator = self
        navigationController.setViewControllers([favouriteNavigationController], animated: false)
    }
}
