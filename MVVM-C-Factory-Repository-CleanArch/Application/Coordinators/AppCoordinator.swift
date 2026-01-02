//
//  AppCoordinator.swift
//  MVVM-C-Factory-Repository-CleanArch
//
//  Created by rico on 2.01.2026.
//

import UIKit

@MainActor
final class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    
    private let window: UIWindow
    private let appFactory: AppFactoryProtocol
    
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
        self.appFactory = AppFactory()
    }
    
    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        startHomeFlow()
    }
    
    private func startHomeFlow() {
        let homeCoordinator = HomeCoordinator(navigationController: navigationController, factory: appFactory)
        childCoordinators.append(homeCoordinator)
        homeCoordinator.start()
    }
}

