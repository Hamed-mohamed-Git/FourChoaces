//
//  LeaguesCoordinator.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 04/05/2023.
//

import Foundation
import UIKit

class LeaguesCoordinator:Coordinator{
    var child: [Coordinator]?
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.child = []
        self.navigationController = navigationController
    }
    
    func start() {
        let leaguesViewController = LeaguesViewController.instantiate()
        leaguesViewController.leaguesCoordinator = self
        navigationController.pushViewController(leaguesViewController, animated: true)
    }
    
    
}
