//
//  DetailViewController.swift
//  MVVM-C-Factory-Repository-CleanArch
//
//  Created by rico on 2.01.2026.
//

import UIKit

final class DetailViewController: UIViewController {
    private let viewModel: DetailViewModelProtocol
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bodyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(viewModel: DetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("not imp")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        setupUI()
        configureData()
    }
    
    private func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(bodyLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            bodyLabel.leadingAnchor.constraint(equalTo: bodyLabel.leadingAnchor, constant: 16),
            bodyLabel.trailingAnchor.constraint(equalTo: bodyLabel.trailingAnchor, constant: -16)
        ])
    }
    
    private func configureData() {
        titleLabel.text = "\(viewModel.idText) - " + viewModel.titleText
        bodyLabel.text = viewModel.bodyText
    }
}
