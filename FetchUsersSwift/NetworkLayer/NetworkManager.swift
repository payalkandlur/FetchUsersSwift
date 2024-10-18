//
//  NetworkManager.swift
//  FetchUsersSwift
//
//  Created by Payal Kandlur on 10/17/24.
//

import Foundation

enum NetworkError: Error {
    case invalidData
    case invalidResponse
    case invalidURL
}

protocol APIService {
    func fetch<T: Decodable>(_ type: T.Type) async throws -> T
}

class NetworkManager : APIService {
    private let endpointUrl = "https://dummyjson.com/users/"
    
    func fetch<T>(_ type: T.Type) async throws -> T where T : Decodable {
        
        guard let url = URL(string: endpointUrl) 
        else { throw NetworkError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode)
        else { throw NetworkError.invalidResponse }
        
        do {
            let jsonDecoder = JSONDecoder()
            let userData = try jsonDecoder.decode(T.self, from: data)
            return userData
        } catch {
            throw NetworkError.invalidData
        }
    }
    
}
