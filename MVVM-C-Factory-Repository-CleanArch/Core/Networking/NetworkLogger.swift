//
//  NetworkLogger.swift
//  MVVM-C-Factory-Repository-CleanArch
//
//  Created by rico on 2.01.2026.
//

import Foundation
import Alamofire

final class NetworkLogger: EventMonitor {
    let queue = DispatchQueue(label: "com.ugurhmz.networklogger")
    
    func request(_ request: Request, didCreateURLRequest urlRequest: URLRequest) {
        #if DEBUG
        let method = urlRequest.httpMethod?.uppercased() ?? "-"
        let url = urlRequest.url?.absoluteString ?? "No URL"
        
        print("\n-----------------------------------------------------------")
        print("🌏 [\(method)] REQUEST -> \(url)")
        if let httpBody = urlRequest.httpBody,
           let bodyString = String(data: httpBody, encoding: .utf8) {
            print("📦 Body: \(bodyString)")
        } else {
            print("📦 Body: None")
        }
        print("-----------------------------------------------------------\n")
        #endif
    }
    
    func requestDidFinish(_ request: Request) {
        #if DEBUG
        let method = request.request?.httpMethod?.uppercased() ?? "-"
        let url = request.request?.url?.absoluteString ?? "No URL"
        let statusCode = request.response?.statusCode ?? 0
        let statusEmoji = (200...299).contains(statusCode) ? "✅" : "❌"
        
        print("\n-----------------------------------------------------------")
        print("\(statusEmoji) [\(method)] RESPONSE <- \(url)")
        print("📊 Status: \(statusCode)")
        
        if let error = request.task?.error {
            print("⚠️ Error: \(error.localizedDescription)")
        }
        print("-----------------------------------------------------------\n")
        #endif
    }
}
