//
//  UserViewModel.swift
//  FetchUsersSwift
//
//  Created by Payal Kandlur on 10/17/24.
//

import Foundation

class UserViewModel {
    
    var user : [User] = []
    private let apiService: APIService
    
    init(apiService: APIService = NetworkManager()) {
        self.apiService = apiService
    }
    
    func fetchUsers() async {
        do {
            let users = try await apiService.fetch(Users.self)
            user = users.users
        } catch {
            print("Error")
        }
    }
}
