//
//  UserResponse.swift
//  Mobiledev_Test
//
//  Created by Mas Bagus on 15/01/25.
//


import Foundation

struct UserResponse: Codable {
    let data: [User]
}

struct User: Codable, Identifiable {
    let id: Int
    let email: String
    let firstName: String
    let lastName: String
    let avatar: String
    
    enum CodingKeys: String, CodingKey {
        case id, email, avatar
        case firstName = "first_name"
        case lastName = "last_name"
    }
}
