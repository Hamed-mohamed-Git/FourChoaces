//
//  AppCoordinator.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 02/05/2023.
//

import Foundation
import UIKit

class AppCoordinator : Coordinator {
    var child: [Coordinator]?
    var navigationController: UINavigationController
    private var defaultSettingsRepository:SettingsRepository!
    
    init(navigationController:UINavigationController,defaultSettingsRepository:SettingsRepository){
        self.child = []
        self.navigationController = navigationController
        self.defaultSettingsRepository = defaultSettingsRepository
    }
    
    func start() {
        
    }
    
    func getEntryPoint() -> UIViewController{
        if(defaultSettingsRepository.getIsAppBrandNew()!){
            return HomeTabBarViewController.instantiate()
        }
        return OnBoardingViewController.instantiate()
    }
    
   
}
