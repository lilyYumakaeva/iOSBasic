//
//  UserInNewCompany.swift
//  NetworkStarting
//
//  Created by Лилия Д. Юмакаева on 01.03.2025.
//
struct UserInNewCompany: Codable {
    let name: String
    let job: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case job
    }
}

struct UserInNewCompanyRoot : Codable {
    let userInNewCompany : [UserInNewCompany]
}
