//
//  VehicleRepository.swift
//  plate360
//
//  Created by Aviran Dabush on 29/10/2025.
//

import Foundation

final class VehicleRepository {
    private let apiClient = APIClient.shared
    
    func fetchVehicle(by number: String, completion: @escaping (Result<[Vehicle], NetworkError>) -> Void) {
        let url = Endpoint.vehicle(number: number)
        
        apiClient.fetch(url: url) { (result: Result<VehicleResponse, NetworkError>) in
            switch result {
            case .success(let response):
                completion(.success(response.result.records))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
