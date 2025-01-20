//
//  NetworkError.swift
//  NetworkLayer
//
//  Created by Лилия Д. Юмакаева on 22.12.2024.
//

import Foundation

enum NetworkError: Error {
    case networkError
    case wrongType
    case invalidStatus
    case serverError
    case clientError
    case noResult
    case invalidURL
    case invalidParsing
}
