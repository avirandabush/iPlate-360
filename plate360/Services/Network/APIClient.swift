//
//  APIClient.swift
//  plate360
//
//  Created by Aviran Dabush on 29/10/2025.
//

import Foundation

final class APIClient {
    static let shared = APIClient()
    private init() {}
    
    func fetch<T: Decodable>(url: URL?, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = url else {
            completion(.failure(.badURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                completion(.failure(.requestFailed))
                return
            }
            
            guard let data = data else {
                completion(.failure(.unknown))
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(.decodingFailed))
            }
        }
        task.resume()
    }
}
