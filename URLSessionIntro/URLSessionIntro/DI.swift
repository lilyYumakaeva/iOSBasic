//
//  DI.swift
//  URLSessionIntro
//
//  Created by Лилия Д. Юмакаева on 19.01.2025.
//
import Foundation

class DI {
    static let shared = DI()
    
    private init() {}
    
    lazy var networkConfiguration: NetworkConfiguration = {
        return NetworkConfiguration()
    }()
    
    lazy var networkClinet: NetworkClient = {
        return NetworkClient(networkConfiguration: networkConfiguration)
    }()
}

