//
//  Provider.swift
//  codable-09-01-25
//
//  Created by Лилия Д. Юмакаева on 08.01.2025.
//

import Foundation
import Moya

enum NetworkProvider {
    case getUsers
}

extension NetworkProvider: TargetType {
    var baseURL: URL {
        URL(string: "https://jsonplaceholder.typicode.com")!
    }
    
    var path: String {
        switch self {
        case .getUsers: "/users"
        }
    }
    
    var method: Moya.Method {
        switch self {
            case .getUsers: .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getUsers: .requestPlain
        }
    }
    
    var headers: [String : String]? {
        nil
    }
    
    
}
