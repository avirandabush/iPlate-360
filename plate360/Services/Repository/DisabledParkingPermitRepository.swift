//
//  DisabledParkingPermitRepository.swift
//  plate360
//
//  Created by Aviran Dabush on 03/11/2025.
//

import Foundation

final class DisabledParkingPermitRepository {
    private let apiClient = APIClient.shared
    
    func fetchDisabledParkingPermit(by number: String, completion: @escaping (Result<[DisabledParkingPermit], NetworkError>) -> Void) {
        let url = Endpoint.disabledParkingPermit(number: number)
        
        apiClient.fetch(url: url) { (result: Result<DisabledParkingPermitResponse, NetworkError>) in
            switch result {
            case .success(let response):
                completion(.success(response.result.records))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
