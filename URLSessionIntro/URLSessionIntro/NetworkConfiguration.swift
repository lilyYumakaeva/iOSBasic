//
//  NetworkConfiguration.swift
//  URLSessionIntro
//
//  Created by Лилия Д. Юмакаева on 18.01.2025.
//
import Foundation

protocol INetworkConfiguration {
    
    func getHeaders() -> [String: String]
    
    func getBaseURL() -> URL
}

class NetworkConfiguration : INetworkConfiguration{
    
    private let apiURL = "https://newsapi.org/v2/"
    private let apiKey = "0e55b40d91464422a4f804d5e0fbc96e"
    
    func getHeaders() -> [String: String] {
        return ["X-Api-Key":apiKey]
    }
    
    func getBaseURL() -> URL {
        return URL(string: apiURL)!
    }
}
