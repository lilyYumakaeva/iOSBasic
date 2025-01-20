//
//  ApiLayer.swift
//  NetworkLayer
//
//  Created by Лилия Д. Юмакаева on 22.12.2024.
//
import Foundation

typealias ApiCallback = (Result<Data, NetworkError>) -> Void

struct ApiLayer {
    
    private let urlSession = URLSession.shared
    
    func makeRequest(_ request: URLRequest, callback: @escaping ApiCallback) -> Void {
        urlSession.dataTask(with: request) { data, response, error in
            guard error == nil else {
                callback(Result.failure(NetworkError.networkError))
                return
            }
            if let validation = validate(response) {
                callback(.failure(validation))
                return
            }
            guard let data else {
                callback(.failure(.noResult))
                return
            }
            
            callback(.success(data))
            
        }.resume()
    }
        
    private func validate(_ response: URLResponse?) -> NetworkError? {
        guard let httpResponse = response as? HTTPURLResponse else {
            return NetworkError.wrongType
        }
        
        switch httpResponse.statusCode {
        case 100..<200, 300..<400:
            return NetworkError.invalidStatus
            case 400..<500:
            return NetworkError.clientError
        case 500..<600:
            return NetworkError.networkError
        default:
            break
        }
        
        return nil
    }
}
