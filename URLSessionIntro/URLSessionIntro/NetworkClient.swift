//
//  NetworkClient.swift
//  URLSessionIntro
//
//  Created by Лилия Д. Юмакаева on 18.01.2025.
//
import Foundation

enum Method: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "PATCH"
}

class NetworkClient /*: NSObject, URLSessionDataDelegate*/ {
    
    private let jsonDecoder = JSONDecoder()
    
    private let networkConfiguration: INetworkConfiguration
    
    init(networkConfiguration: INetworkConfiguration) {
        self.networkConfiguration = networkConfiguration
    }
    
    private var resultHandler: ((any Codable) -> Void)? = nil// ((Result<Data, Error>) -> Void)?
    private let operation = OperationQueue()
    
    private lazy var urlSession: URLSession = {
        let urlSession = URLSession(configuration: .default)
//        let urlSession = URLSession(
//            configuration: .default,
//            delegate: self,
//            delegateQueue: operation
//        )
        return urlSession
    }()
    
    private var urlDatatask: URLSessionDataTask? = nil
    
    func request<T: Codable>(query: String, method: Method, params: [String: String], completionHandler: @escaping(Result<T, Error>) -> Void) {
       
        let urlPath = "\(networkConfiguration.getBaseURL())\(query)"
        guard let url = URL(string: urlPath) else {
            completionHandler(.failure(CustomError(message: "wrong url")))
            return
        }
        var urlRequest = URLRequest(url: url)
        for header in networkConfiguration.getHeaders() {
            urlRequest.addValue(header.value, forHTTPHeaderField: header.key)
        }
        self.urlDatatask = urlSession.dataTask(with: urlRequest) { [weak self] data, response, error in
            guard let self = self else { return }
            if let error = error {
                DispatchQueue.main.async {
                    completionHandler(.failure(error))
                }
            }
            self.processData(data: data, completionHandler: completionHandler)
        }
        self.urlDatatask?.resume()
    }
    
    private func processData<T:Codable>(data: Data?, completionHandler: @escaping (Result<T, Error>) -> Void){
        if let data = data {
            let json = String(data: data, encoding: .utf8)
            print(json)
            if let content = try? self.jsonDecoder.decode(T.self, from: data){
                DispatchQueue.main.async {
                    completionHandler(.success(content))
                }
            } else {
                DispatchQueue.main.async{
                    completionHandler(.failure(CustomError(message: "no data")))
                }
               
            }
        }
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        
    }
}
