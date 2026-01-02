//
//  Endpoint.swift
//  MVVM-C-Factory-Repository-CleanArch
//
//  Created by rico on 2.01.2026.
//

import Foundation
import Alamofire

protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var parameters: Parameters? { get }
    var encoding: ParameterEncoding { get }
}

extension Endpoint {
    var baseURL: String {
        return "https://jsonplaceholder.typicode.com"
    }
    
    var headers: HTTPHeaders? {
        return [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
    }
    
    var encoding: ParameterEncoding {
        return method == .get ? URLEncoding.default : JSONEncoding.default
    }
}
