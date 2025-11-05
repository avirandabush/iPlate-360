//
//  TabBuilder.swift
//  plate360
//
//  Created by Aviran Dabush on 03/11/2025.
//

import Foundation

class TabBuilder {
    
    private func makeItem(_ title: String, _ value: String?) -> DisplayItem {
        let safeValue = value?.isEmpty == false ? value! : "tab.builder.makeItem.noData".localized
        return DisplayItem(title: title, value: safeValue)
    }

    func TechnicalTabBuilder(vehicleDetails: [VehicleDetails], vehicleHistory: [VehicleHistory]) -> [DisplayItem] {
        var items: [DisplayItem] = []
        
        if let details = vehicleDetails.first {
            items.append(makeItem(VehicleDetails.Field.carNumber.rawValue.localized, "\(details.carNumber ?? 0)"))
            items.append(makeItem(VehicleDetails.Field.manufacturerCode.rawValue.localized, "\(details.manufacturerCode ?? 0)"))
            items.append(makeItem(VehicleDetails.Field.manufacturerName.rawValue.localized, "\(details.manufacturerName ?? "")"))
            items.append(makeItem(VehicleDetails.Field.modelType.rawValue.localized, "\(details.modelType ?? "")"))
            items.append(makeItem(VehicleDetails.Field.modelCode.rawValue.localized, "\(details.modelCode ?? 0)"))
            items.append(makeItem(VehicleDetails.Field.modelName.rawValue.localized, "\(details.modelName ?? "")"))
            items.append(makeItem(VehicleDetails.Field.trimLevel.rawValue.localized, "\(details.trimLevel ?? "")"))
            items.append(makeItem(VehicleDetails.Field.safetyLevel.rawValue.localized, "\(details.safetyLevel ?? 0)"))
            items.append(makeItem(VehicleDetails.Field.emissionGroup.rawValue.localized, "\(details.emissionGroup ?? 0)"))
            items.append(makeItem(VehicleDetails.Field.manufactureYear.rawValue.localized, "\(details.manufactureYear ?? 0)"))
            items.append(makeItem(VehicleDetails.Field.engineModel.rawValue.localized, "\(details.engineModel ?? "")"))
            items.append(makeItem(VehicleDetails.Field.chassisNumber.rawValue.localized, "\(details.chassisNumber ?? "")"))
            items.append(makeItem(VehicleDetails.Field.colorCode.rawValue.localized, "\(details.colorCode ?? 0)"))
            items.append(makeItem(VehicleDetails.Field.color.rawValue.localized, "\(details.color ?? "")"))
            items.append(makeItem(VehicleDetails.Field.frontTires.rawValue.localized, "\(details.frontTires ?? "")"))
            items.append(makeItem(VehicleDetails.Field.rearTires.rawValue.localized, "\(details.rearTires ?? "")"))
            items.append(makeItem(VehicleDetails.Field.fuelType.rawValue.localized, "\(details.fuelType ?? "")"))
            items.append(makeItem(VehicleDetails.Field.tradeName.rawValue.localized, "\(details.tradeName ?? "")"))
        }
        
        if let history = vehicleHistory.first {
            items.append(makeItem(VehicleHistory.Field.engineNumber.rawValue.localized, "\(history.engineNumber ?? "")"))
        }
        
        return items
    }
    
    func licensingTabBuilder(vehicleDetails: [VehicleDetails], vehicleHistory: [VehicleHistory]) -> [DisplayItem] {
        var items: [DisplayItem] = []
        
        if let details = vehicleDetails.first {
            items.append(makeItem(VehicleDetails.Field.lastInspectionDate.rawValue.localized, "\(details.lastInspectionDate ?? "")"))
            items.append(makeItem(VehicleDetails.Field.inspectionValidity.rawValue.localized, "\(details.inspectionValidity ?? "")"))
            items.append(makeItem(VehicleDetails.Field.ownershipType.rawValue.localized, "\(details.ownershipType ?? "")"))
            items.append(makeItem(VehicleDetails.Field.registrationDirective.rawValue.localized, "\(details.registrationDirective ?? 0)"))
            items.append(makeItem(VehicleDetails.Field.roadEntryDate.rawValue.localized, "\(details.roadEntryDate ?? "")"))
        }
        
        if let history = vehicleHistory.first {
            items.append(makeItem(VehicleHistory.Field.lastMileage.rawValue.localized, "\(history.lastMileage ?? 0)"))
            items.append(makeItem(VehicleHistory.Field.structureChangeFlag.rawValue.localized, "\(history.structureChangeFlag ?? 0)"))
            items.append(makeItem(VehicleHistory.Field.lpgInspectionFlag.rawValue.localized, "\(history.lpgInspectionFlag ?? 0)"))
            items.append(makeItem(VehicleHistory.Field.colorChangeFlag.rawValue.localized, "\(history.colorChangeFlag ?? 0)"))
            items.append(makeItem(VehicleHistory.Field.tireChangeFlag.rawValue.localized, "\(history.tireChangeFlag ?? 0)"))
            items.append(makeItem(VehicleHistory.Field.firstRegistrationDate.rawValue.localized, "\(history.firstRegistrationDate ?? "")"))
            items.append(makeItem(VehicleHistory.Field.originalityName.rawValue.localized, "\(history.originalityName ?? "")"))
            
        }
        
        return items
    }
    
    func safetyTabBuilder(vehicleDetails: [VehicleDetails], vehicleHistory: [VehicleHistory]) -> [DisplayItem] {
        var items: [DisplayItem] = []
        
        if let details = vehicleDetails.first {
            items.append(makeItem(VehicleDetails.Field.safetyLevel.rawValue.localized, "\(details.safetyLevel ?? 0)"))
        }
        
        if let history = vehicleHistory.first {
            
        }
        
        return items
    }
    
    func miscellaneousTabBuilder(disabledParkingPermit: [DisabledParkingPermit], carExists: Bool) -> [DisplayItem] {
        guard carExists == true else { return [] }
        
        var items: [DisplayItem] = []
        
        if let permit = disabledParkingPermit.first {
            items.append(makeItem(DisabledParkingPermit.Field.badgeTitle.rawValue.localized, DisabledParkingPermit.Field.yesBadge.rawValue.localized))
            items.append(makeItem(DisabledParkingPermit.Field.badgeCreationDate.rawValue.localized, "\(permit.badgeCreationDate ?? 0)"))
            items.append(makeItem(DisabledParkingPermit.Field.badgeType.rawValue.localized, "\(permit.badgeType ?? 0)"))
        } else {
            items.append(makeItem(DisabledParkingPermit.Field.badgeTitle.rawValue.localized, DisabledParkingPermit.Field.noBadge.rawValue.localized))
        }
        
        return items
    }
}
