//
//  User.swift
//  FetchUsersSwift
//
//  Created by Payal Kandlur on 17/16/24.
//

import Foundation

struct Users: Codable {
    let users: [User]
}

struct User: Codable {
    let firstName: String
    let id: Int
    let email: String
}

