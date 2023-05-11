//
//  HomeScreenCoordinate.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 02/05/2023.
//

import Foundation
import UIKit

class HomeCoordinaor : Coordinator {
    var child: [Coordinator]?
    var navigationController: UINavigationController
    var tabBarDelegate:TabBarDelegate!
    
    init(navigationController:UINavigationController,tabBarDelegate:TabBarDelegate){
        self.navigationController = navigationController
        self.tabBarDelegate = tabBarDelegate
    }
    
    func start() {
        let homeViewController = HomeViewController.instantiate()
        homeViewController.homeCoordinator = self
        navigationController.setViewControllers([homeViewController], animated: false)
        
    }
    
    func navigateToOnlineleagues() {
        
        let leaguesCoordinator = LeaguesCoordinator(navigationController: navigationController)
        tabBarDelegate.navigateAndHidden()
        leaguesCoordinator.start()
    }
    
    
}
