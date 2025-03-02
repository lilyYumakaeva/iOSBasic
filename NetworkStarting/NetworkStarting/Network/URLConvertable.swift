//
//  URLConvertable.swift
//  NetworkLayer
//
//  Created by Лилия Д. Юмакаева on 22.12.2024.
//
import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum Hosts: String {
    case randomUser = "randomuser.me"
    case reqres = "reqres.in"
}

protocol URLConvertable {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var urlQuery: [String : String] { get }
    var method: HTTPMethod { get }
}

extension URLConvertable {
    var scheme: String { "https" }
   // var host: String { Hosts.randomUser.rawValue}
    //var method: String { HTTPMethod.get.rawValue }
    
    func asRequest() throws -> URLRequest {
        var components: URLComponents = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = urlQuery.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }
        
        guard let url = components.url else {
            throw NetworkError.invalidURL
        }
        print("url = \(url)")
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        return request
        
    }
}

enum UsersEndpoint: URLConvertable {
    var host: String { Hosts.randomUser.rawValue}
    var method:  HTTPMethod {.get}
    
    case users
    
    var path: String {
        switch self {
        case .users:
            return "/api"
        }
    }
    var urlQuery: [String : String] {
        switch self {
        case .users:
            return ["results":"10"]
        }
    }
}

enum UsersInNewCompanyEndpoint: URLConvertable {
    var host: String { Hosts.reqres.rawValue}
    var method:  HTTPMethod {.post}
    
    case users
    
    var path: String {
        switch self {
        case .users:
            return "/api/users"
        }
    }
    var urlQuery: [String : String] {
        switch self {
        case .users:
            return [:]
        }
    }
}
