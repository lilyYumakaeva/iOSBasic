//
//  Article.swift
//  URLSessionIntro
//
//  Created by Лилия Д. Юмакаева on 19.01.2025.
//
import Foundation

struct Article: Codable {
    let articles: [ArticleItem]
    
    enum CodingKeys: String, CodingKey {
        case articles
    }
}
