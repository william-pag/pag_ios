//
//  ApolloClient.swift
//  pag_ios
//
//  Created by William Vux on 14/10/24.
//

import Foundation

final class ApolloClient {
    public static let shared = ApolloClient()
    private var request: URLRequest
    
    init() {
        request = URLRequest(url: URL(string: "http://192.168.1.8:3000/graphql")!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    }
    
    func setToken(_ token: String) {
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
    }
    
    func call<T: Codable>(body: String, completion: @escaping (Result<T, ApolloError>) -> Void) {
//        print(27, body)
        let query = GraphQuery(query: body)
        let dataQuery = try? JSONEncoder().encode(query)
        request.httpBody = dataQuery
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data else {
                completion(.failure(ApolloError.invalidResponse(error: "Something went wrong")))
                return
            }
            
                        
            do {
//                print(String(data: data, encoding: .utf8))
                let response = try JSONDecoder().decode(DataModel<T>.self, from: data)
                
                completion(.success(response.data))
            } catch {
                completion(.failure(ApolloError.invalidResponse(error: "Something went wrong")))
            }
        }.resume()
    }
    
    struct GraphQuery: Encodable {
        let query: String
    }
}

enum ApolloError: Error {
    case invalidResponse(error: String)
}
