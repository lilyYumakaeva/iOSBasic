//
//  CheckAllTests.swift
//  UIViewControllerTests
//
//  Created by Лилия Д. Юмакаева on 11.11.2024.
//

import Foundation

enum SoftAssertError: Error {
    case multipleFailures([String])
    
    var localizedDescription: String {
        switch self {
        case .multipleFailures(let messages):
            return "Soft Assert failed with the following messages: \n" + messages.joined(separator: "\n")
        }
    }
}

//enum SoftAssertNSError: NSError {
//    case multipleFailures([String])
//    
//    var localizedDescription: String {
//        switch self {
//        case .multipleFailures(let messages):
//            return "Soft Assert failed with the following messages: \n" + messages.joined(separator: "\n")
//        }
//    }
//}
