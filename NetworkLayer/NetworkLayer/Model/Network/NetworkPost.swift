//
//  NetworkPost.swift
//  NetworkLayer
//
//  Created by Лилия Д. Юмакаева on 22.12.2024.
//
import Foundation

struct NetworkPost: Decodable{
    let userId: Int
    let id: Int
    let body: String
    let title: String
}
