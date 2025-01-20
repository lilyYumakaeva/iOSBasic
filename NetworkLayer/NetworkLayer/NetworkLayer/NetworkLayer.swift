//
//  NetworkLayer.swift
//  NetworkLayer
//
//  Created by Лилия Д. Юмакаева on 22.12.2024.
//

import Foundation

struct NetworkLayer {
    private let apiLayer = ApiLayer()
    
    func requestAllPosts(_ callbak: @escaping (Result<[Post], NetworkError>) -> Void) {
        let request = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
        apiLayer.makeRequest(request) { result in
            switch result {
            case .failure(let someError):
                callbak(.failure(someError))
            case .success(let responseData):
                if let parsed = try? JSONDecoder().decode([NetworkPost].self, from: responseData) {
                    let posts = parsed.map{ networkPost in
                        Post(userId: networkPost.userId, id: networkPost.id, body: networkPost.body, title: networkPost.title)
                    }
                    callbak(.success(posts))
                }
                else {
                    callbak(.failure(.invalidParsing))
                }
            }
        }
        
    }
    
    func getAllComments(postId: Int, _ callbak: @escaping (Result<[Comment], NetworkError>) -> Void) {
        let request = try! PostsEndpoint.comments(id: postId).asRequest()
        //let request = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/comments?postId=\(postId)")!)
        apiLayer.makeRequest(request) { result in
            switch result {
            case .failure(let someError):
                callbak(.failure(someError))
            case .success(let responseData):
                if let parsed = try? JSONDecoder().decode([NetworkComment].self, from: responseData) {
                    let posts = parsed.map{ networkComment in
                        Comment(
                            postId: networkComment.postId,
                            id: networkComment.id,
                            body: networkComment.body,
                            email: networkComment.email,
                            name: networkComment.name
                        )
                    }
                    callbak(.success(posts))
                }
                else {
                    callbak(.failure(.invalidParsing))
                }
            }
        }
    }
}
