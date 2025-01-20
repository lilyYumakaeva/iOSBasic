//
//  ArticleItem.swift
//  URLSessionIntro
//
//  Created by Лилия Д. Юмакаева on 19.01.2025.
//
import Foundation

struct ArticleItem : Codable {
    let author: String?
    let title: String?
    let _description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    
    enum CodingKeys: String, CodingKey {
        case _description = "description"
        case urlToImage = "urlToImage"
        case publishedAt = "publishedAt"
        case url = "url"
        case author = "author"
        case title = "title"
        case content = "content"
    }
}
