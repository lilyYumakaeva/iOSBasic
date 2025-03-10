//
//  NetworkComment.swift
//  NetworkLayer
//
//  Created by Лилия Д. Юмакаева on 22.12.2024.
//
import Foundation

struct NetworkComment: Decodable{
    let postId: Int
    let id: Int
    let body: String
    let email: String
    let name: String
}
