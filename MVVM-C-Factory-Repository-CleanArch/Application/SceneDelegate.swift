//
//  SceneDelegate.swift
//  MVVM-C-Factory-Repository-CleanArch
//
//  Created by rico on 1.01.2026.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let appCoordinator = AppCoordinator(window: window)
        self.appCoordinator = appCoordinator
        appCoordinator.start()
        
        self.window = window
    }
}

