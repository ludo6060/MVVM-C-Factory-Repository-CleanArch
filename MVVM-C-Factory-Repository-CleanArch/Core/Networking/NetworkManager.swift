//
//  NetworkManager.swift
//  MVVM-C-Factory-Repository-CleanArch
//
//  Created by rico on 2.01.2026.
//

import Foundation
import Alamofire

protocol NetworkServiceProtocol {
    func fetch<T: Decodable>(_ endpoint: Endpoint, type: T.Type) async -> Result<T, NetworkError>
}

final class NetworkManager: NetworkServiceProtocol {
    private let session: Session
    
    init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        let monitors: [EventMonitor] = [NetworkLogger()]
        self.session = Session(configuration: configuration, eventMonitors: monitors)
    }
    
    func fetch<T: Decodable>(_ endpoint: any Endpoint, type: T.Type) async -> Result<T, NetworkError> {
        guard let url = URL(string: endpoint.baseURL + endpoint.path) else {
            return .failure(.invalidURL)
        }
        
        let request = session.request(
            url,
            method: endpoint.method,
            parameters: endpoint.parameters,
            encoding: endpoint.encoding,
            headers: endpoint.headers
        ).validate()
        
        let task = request.serializingDecodable(T.self)
        let dataResponse = await task.response
        
        switch dataResponse.result {
        case .success(let data):
            return .success(data)
        case .failure(let error):
            if let statusCode = dataResponse.response?.statusCode {
                return .failure(.serverError(statusCode: statusCode))
            }
            return .failure(.unknown(error))
        }
    }
}
