//
//  HomeContracts.swift
//  MVVM-C-Factory-Repository-CleanArch
//
//  Created by rico on 1.01.2026.
//

import Foundation

@MainActor
protocol HomeNavigationDelegate: AnyObject {
    //  navigateToDetail
}

@MainActor
protocol HomeViewModelDelegate: AnyObject {
    func handleViewModelOutput(state: HomeViewState)
}

@MainActor
protocol HomeViewModelProtocol: AnyObject {
    var navigationDelegate: HomeNavigationDelegate? { get set }
    var viewDelegate: HomeViewModelDelegate? { get set }
    
    func numberOfItems() -> Int
    func item(at index: Int) -> PostResponse?
    
    func viewDidLoad()
}
