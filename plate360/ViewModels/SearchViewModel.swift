//
//  SearchViewModel.swift
//  plate360
//
//  Created by Aviran Dabush on 29/10/2025.
//

import UIKit

final class SearchViewModel {
    private let vehicleDetailsRepository = VehicleDetailsRepository()
    private let publicVehicleRepository = PublicVehicleRepository()
    private let vehicleHistoryRepository = VehicleHistoryRepository()
    private let disabledParkingPermitRepository = DisabledParkingPermitRepository()
    private let tabBuilder = TabBuilder()
    
    var vehicleDetails: [VehicleDetails] = []
    var publicVehicle: [PublicVehicle] = []
    var vehicleHistory: [VehicleHistory] = []
    var disabledParkingPermit: [DisabledParkingPermit] = []
    
    var onDataUpdated: (() -> Void)?
    var onError: ((String) -> Void)?
    
    func searchVehicle(by number: String) {
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        vehicleDetailsRepository.fetchVehicleDetails(by: number) { [weak self] result in
            switch result {
            case .success(let vehicleDetails):
                self?.vehicleDetails = vehicleDetails
            case .failure(let error):
                self?.onError?("Vehicle error: \(error)")
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        publicVehicleRepository.fetchPublicVehicle(by: number) { [weak self] result in
            switch result {
            case .success(let vehicles):
                self?.publicVehicle = vehicles
            case .failure(let error):
                self?.onError?("Vehicle error: \(error)")
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        vehicleHistoryRepository.fetchHistory(by: number) { [weak self] result in
            switch result {
            case .success(let history):
                self?.vehicleHistory = history
            case .failure(let error):
                self?.onError?("History error: \(error)")
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        disabledParkingPermitRepository.fetchDisabledParkingPermit(by: number) { [weak self] result in
            switch result {
            case .success(let permit):
                self?.disabledParkingPermit = permit
            case .failure(let error):
                self?.onError?("History error: \(error)")
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) { [weak self] in
            self?.onDataUpdated?()
        }
    }
    
    func displayItems(for tab: ResultsTabs) -> [DisplayItem] {
        switch tab {
        case .technical:
            return tabBuilder.TechnicalTabBuilder(vehicleDetails: vehicleDetails, vehicleHistory: vehicleHistory)
        case .licensing:
            return tabBuilder.licensingTabBuilder(vehicleDetails: vehicleDetails, vehicleHistory: vehicleHistory)
        case .safety:
            return tabBuilder.safetyTabBuilder(vehicleDetails: vehicleDetails, vehicleHistory: vehicleHistory)
        case .miscellaneous:
            return tabBuilder.miscellaneousTabBuilder(disabledParkingPermit: disabledParkingPermit, carExists: !vehicleDetails.isEmpty)
        }
    }
}
