//
//  User.swift
//  NetworkStarting
//
//  Created by Лилия Д. Юмакаева on 28.01.2025.
//
import Foundation

struct Response: Codable {
    let results: [User]
    let info: Info
}

struct User: Codable {
    let gender: String
    let name: Name
    let email: String
    let phone, cell: String
    let picture: Picture
}

// MARK: - Dob
struct Dob: Codable {
    let date: String
    let age: Int
}

// MARK: - ID
struct ID: Codable {
    let name: String
    let value: String
}

// MARK: - Location
struct Location: Codable {
    let street: Street
    let city, state, country: String
    let postcode: Int
    let coordinates: Coordinates
    let timezone: Timezone
}

// MARK: - Coordinates
struct Coordinates: Codable {
    let latitude, longitude: String
}

// MARK: - Street
struct Street: Codable {
    let number: Int
    let name: String
}

// MARK: - Timezone
struct Timezone: Codable {
    let offset, description: String
}

// MARK: - Login
struct Login: Codable {
    let uuid, username, password, salt: String
    let md5, sha1, sha256: String
}

// MARK: - Name
struct Name: Codable {
    let title, first, last: String
}

// MARK: - Picture
struct Picture: Codable {
    let large, medium, thumbnail: String
}

struct Info: Codable {
    let seed: String
}

extension User {
    func getFullName() -> String {
        return "\(name.title) \(name.first) \(name.last)"
    }
}
