//
//  NetworkError.swift
//  NetworkStarting
//
//  Created by Лилия Д. Юмакаева on 27.01.2025.
//
import Foundation

enum NetworkError: Error {
    case networkError
    case invalidURLResponse
    case invalidStatusCode
    case serverError
    case clientError
    case noResult
    case invalidURL
    case invalidParsing
}
