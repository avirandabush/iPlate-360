//
//  SearchViewModel.swift
//  plate360
//
//  Created by Aviran Dabush on 29/10/2025.
//

import Foundation

final class SearchViewModel {
    private let repository = VehicleRepository()
    
    var vehicles: [Vehicle] = []
    var onDataUpdated: (() -> Void)?
    var onError: ((String) -> Void)?
    
    func searchVehicle(by number: String) {
        repository.fetchVehicle(by: number) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let vehicles):
                    self?.vehicles = vehicles
                    self?.onDataUpdated?()
                case .failure(let error):
                    self?.onError?("Error: \(error)")
                }
            }
        }
    }
}
