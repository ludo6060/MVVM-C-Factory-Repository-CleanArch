//
//  HomeContracts.swift
//  MVVM-C-Factory-Repository-CleanArch
//
//  Created by rico on 1.01.2026.
//

import Foundation

@MainActor
protocol HomeNavigationDelegate: AnyObject {
    // Navigation..
}

@MainActor
protocol HomeViewModelProtocol: AnyObject {
    var navigationDelegate: HomeNavigationDelegate { get }
    func viewDidload()
}
