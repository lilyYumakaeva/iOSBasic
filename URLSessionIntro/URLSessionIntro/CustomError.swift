//
//  CustomError.swift
//  URLSessionIntro
//
//  Created by Лилия Д. Юмакаева on 19.01.2025.
//
import Foundation

struct CustomError: Error {
    let message: String
    
    init(message: String) {
        self.message = message
    }
    
}

