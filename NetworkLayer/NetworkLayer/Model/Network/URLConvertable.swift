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

protocol URLConvertable {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var urlQuery: [String : String] { get }
    var method: HTTPMethod { get }
}

extension URLConvertable {
    var scheme: String { "https" }
    var host: String { "jsonplaceholder.typicode.com" }
    var method: String { HTTPMethod.get.rawValue }
    
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
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = method
        
        return request
        
    }
}

enum PostsEndpoint: URLConvertable {
    case posts
    case comments(id :Int)
    
    var path: String {
        switch self {
        case .posts:
            return "/posts"
        case .comments(id: let id):
            return "/comments"
        }
    }
    var urlQuery: [String : String] {
        switch self {
        case .posts:
            return [:]
        case .comments(let id):
            return ["postId": "\(id)"]
        }
    }
    
    var method: HTTPMethod {.get}
}
