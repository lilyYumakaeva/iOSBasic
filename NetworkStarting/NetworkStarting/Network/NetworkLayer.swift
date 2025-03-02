//
//  NetworkLayer.swift
//  NetworkStarting
//
//  Created by Лилия Д. Юмакаева on 28.01.2025.
//
import Foundation
import UIKit

struct NetworkLayer {
    private let apiLayer = ApiLayer()
    
    func requestUser(_ callbak: @escaping (Result<[User], NetworkError>) -> Void) {
        let request = try! UsersEndpoint.users.asRequest()
        apiLayer.makeRequest(request) { result in
            switch result {
            case .failure(let someError):
                callbak(.failure(someError))
            case .success(let responseData):
                if let parsed = try? JSONDecoder().decode(Response.self, from: responseData) {
                    let response = parsed.results
                    let users = response.map{ user in
                        User(
                            gender: user.gender,
                            name: user.name,
                            email: user.email,
                            phone: user.phone,
                            cell: user.cell,
                            picture: user.picture
                        )
                    }
                    callbak(.success(users))
                }
                else {
                    callbak(.failure(.invalidParsing))
                }
            }
        }
        
    }
    
    func getImage(urlString: String, _ callbak: @escaping (Result<UIImage, NetworkError>) -> Void) {
        guard let url = URL(string: urlString) else {
            callbak(.failure(.invalidURL))
            return
        }
        let request = URLRequest(url: url)
        apiLayer.makeRequest(request) { result in
            switch result {
            case .failure(let someError):
                callbak(.failure(someError))
            case .success(let responseData):
                if let imageData = UIImage(data: responseData) {
                    callbak(.success(imageData))
                } else {
                    callbak(.failure(.invalidParsing))
                }
            }
        }
    }
    
    func createUserInNewCompany(user: User, _ callbak: @escaping (Result<UserInNewCompany, NetworkError>) -> Void) {
        var request = try! UsersInNewCompanyEndpoint.users.asRequest()
        
        let userInNewCompany = UserInNewCompany(name: user.getFullName(), job: "some job")
        let jsonData = try? JSONEncoder().encode(userInNewCompany)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        apiLayer.makeRequest(request) { result in
            switch result {
            case .failure(let someError):
                callbak(.failure(someError))
            case .success(let responseData):
                if let parsed = try? JSONDecoder().decode(UserInNewCompany.self, from: responseData) {
                    callbak(.success(parsed))
                }
                else {
                    callbak(.failure(.invalidParsing))
                }
            }
        }
    }
}
