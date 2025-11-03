//
//  VehicleDetailsRepository.swift
//  plate360
//
//  Created by Aviran Dabush on 29/10/2025.
//

import Foundation

final class VehicleDetailsRepository {
    private let apiClient = APIClient.shared
    
    func fetchVehicleDetails(by number: String, completion: @escaping (Result<[VehicleDetails], NetworkError>) -> Void) {
        let url = Endpoint.vehicleDetails(number: number)
        
        apiClient.fetch(url: url) { (result: Result<VehicleDetailsResponse, NetworkError>) in
            switch result {
            case .success(let response):
                completion(.success(response.result.records))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
