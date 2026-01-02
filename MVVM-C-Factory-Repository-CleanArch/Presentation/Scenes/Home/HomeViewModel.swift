//
//  HomeViewModel.swift
//  MVVM-C-Factory-Repository-CleanArch
//
//  Created by rico on 1.01.2026.
//

import Foundation

@MainActor
final class HomeViewModel: HomeViewModelProtocol {
    weak var navigationDelegate: HomeNavigationDelegate?
    
    func viewDidLoad() {
        print("HomeViewModel: loaded.")
    }
}
