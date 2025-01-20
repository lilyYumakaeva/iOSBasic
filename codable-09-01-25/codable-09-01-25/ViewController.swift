//
//  ViewController.swift
//  codable-09-01-25
//
//  Created by Лилия Д. Юмакаева on 08.01.2025.
//

import UIKit
import Moya

class ViewController: UIViewController {
    
    private var provider = MoyaProvider<NetworkProvider>()

    override func viewDidLoad() {
        super.viewDidLoad()
        //getUsers()
        getUsersViaMoya()
    }
    
    private func getUsersViaMoya() {
        provider.request(.getUsers) { result in
            switch result {
            case .success(let response):
                do {
                    let users = try JSONDecoder().decode([User].self, from: response.data)
                    for user in users {
                        print(user)
                    }
                } catch {
                    
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    private func getUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                //decoder.keyDecodingStrategy = .convertFromSnakeCase
//                decoder.keyDecodingStrategy = .custom { key in
//
//                }
               // decoder.dateDecodingStrategy = .deferredToDate
                let users = try decoder.decode([User].self, from: data)
                for user in users {
                    print(user)
                }
            } catch {
                
            }
        }
        task.resume()
    }
    
    func postRequest() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        let session = URLSession.shared
        let user = User(
            id: 123,
            name: "qwer",
            username: "awef",
            email: "asdf",
            address: Address(
                street: "Linone",
                suite: "asdf.",
                city  : "Moscpw",
                zipcode: "12345",
                geo: GeoLocation(latitude: 34.123123, longitude: 23.123123)
            ),
            phone: "12345",
            website: "234.er",
            company: Company(
                name: "asdf",
                catchPhrase: "asdf",
                bs: "adsf")
        )
        let data = try? JSONEncoder().encode(user)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        
        let task = session.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                //decoder.keyDecodingStrategy = .convertFromSnakeCase
//                decoder.keyDecodingStrategy = .custom { key in
//
//                }
               // decoder.dateDecodingStrategy = .deferredToDate
                let users = try decoder.decode([User].self, from: data)
                for user in users {
                    print(user)
                }
            } catch {
                
            }
        }
        task.resume()
    }
    
}

