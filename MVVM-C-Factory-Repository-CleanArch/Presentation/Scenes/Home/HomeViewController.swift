//
//  HomeViewController.swift
//  MVVM-C-Factory-Repository-CleanArch
//
//  Created by rico on 1.01.2026.
//

import UIKit

final class HomeViewController: UIViewController {
    private var viewModel: HomeViewModelProtocol
    
    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not imp")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Home Screen"
        viewModel.viewDidLoad()
    }
}
