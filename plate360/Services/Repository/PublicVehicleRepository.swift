//
//  PublicVehicleRepository.swift
//  plate360
//
//  Created by Aviran Dabush on 02/11/2025.
//

import Foundation

final class PublicVehicleRepository {
    private let apiClient = APIClient.shared
    
    func fetchPublicVehicle(by number: String, completion: @escaping (Result<[PublicVehicle], NetworkError>) -> Void) {
        let url = Endpoint.vehicleHistory(number: number)
        
        apiClient.fetch(url: url) { (result: Result<PublicVehicleResponse, NetworkError>) in
            switch result {
            case .success(let response):
                completion(.success(response.result.records))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
