//
//  AppFactory.swift
//  MVVM-C-Factory-Repository-CleanArch
//
//  Created by rico on 1.01.2026.
//

import UIKit

@MainActor
protocol AppFactoryProtocol {
    func makeHomeViewController(coordinator: HomeNavigationDelegate) -> UIViewController
}

@MainActor
final class AppFactory: AppFactoryProtocol {
    init() { }
    
    func makeHomeViewController(coordinator: HomeNavigationDelegate) -> UIViewController {
       // Later..
    }
}
