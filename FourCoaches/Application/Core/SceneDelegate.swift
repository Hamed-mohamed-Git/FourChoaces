//
//  SceneDelegate.swift
//  firstProjectData
//
//  Created by Hamed Mohamed on 26/04/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scence = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scence)
        window?.rootViewController = AppCoordinator(navigationController: UINavigationController(), defaultSettingsRepository: DefaultSettingsRepository()).getEntryPoint()
        window?.makeKeyAndVisible()
    }


    func sceneDidEnterBackground(_ scene: UIScene) {
        CoreDataStorage.shared.saveContext()
    }


}

