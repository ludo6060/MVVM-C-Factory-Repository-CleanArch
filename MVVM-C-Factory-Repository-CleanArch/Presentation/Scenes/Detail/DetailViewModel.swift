//
//  DetailViewModel.swift
//  MVVM-C-Factory-Repository-CleanArch
//
//  Created by rico on 2.01.2026.
//

import Foundation

protocol DetailViewModelProtocol {
    var titleText: String { get }
    var bodyText: String { get }
    var idText: Int { get }
}

final class DetailViewModel: DetailViewModelProtocol {
    private let post: PostResponse
    
    init(post: PostResponse) {
        self.post = post
    }
    
    var titleText: String { post.title ?? "-" }
    var bodyText: String { post.body ?? "-" }
    var idText: Int { post.id }
}
