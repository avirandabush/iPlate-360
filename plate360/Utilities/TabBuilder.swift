//
//  TabBuilder.swift
//  plate360
//
//  Created by Aviran Dabush on 03/11/2025.
//

import Foundation

class TabBuilder {
    
    private func makeItem(_ title: String, _ value: String?) -> DisplayItem {
        let safeValue = value?.isEmpty == false ? value! : LanguageManager.shared.isHebrew ? "אין נתונים" : "No data"
        return DisplayItem(title: title, value: safeValue)
    }

    func TechnicalTabBuilder(vehicleDetails: [VehicleDetails], vehicleHistory: [VehicleHistory]) -> [DisplayItem] {
        var items: [DisplayItem] = []
        
        if let details = vehicleDetails.first {
            items.append(makeItem(VehicleDetails.Field.carNumber.hebrewTitle, "\(details.carNumber ?? 0)"))
            items.append(makeItem(VehicleDetails.Field.manufacturerCode.hebrewTitle, "\(details.manufacturerCode ?? 0)"))
            items.append(makeItem(VehicleDetails.Field.manufacturerName.hebrewTitle, "\(details.manufacturerName ?? "")"))
            items.append(makeItem(VehicleDetails.Field.modelType.hebrewTitle, "\(details.modelType ?? "")"))
            items.append(makeItem(VehicleDetails.Field.modelCode.hebrewTitle, "\(details.modelCode ?? 0)"))
            items.append(makeItem(VehicleDetails.Field.modelName.hebrewTitle, "\(details.modelName ?? "")"))
            items.append(makeItem(VehicleDetails.Field.trimLevel.hebrewTitle, "\(details.trimLevel ?? "")"))
            items.append(makeItem(VehicleDetails.Field.safetyLevel.hebrewTitle, "\(details.safetyLevel ?? 0)"))
            items.append(makeItem(VehicleDetails.Field.emissionGroup.hebrewTitle, "\(details.emissionGroup ?? 0)"))
            items.append(makeItem(VehicleDetails.Field.manufactureYear.hebrewTitle, "\(details.manufactureYear ?? 0)"))
            items.append(makeItem(VehicleDetails.Field.engineModel.hebrewTitle, "\(details.engineModel ?? "")"))
            items.append(makeItem(VehicleDetails.Field.chassisNumber.hebrewTitle, "\(details.chassisNumber ?? "")"))
            items.append(makeItem(VehicleDetails.Field.colorCode.hebrewTitle, "\(details.colorCode ?? 0)"))
            items.append(makeItem(VehicleDetails.Field.color.hebrewTitle, "\(details.color ?? "")"))
            items.append(makeItem(VehicleDetails.Field.frontTires.hebrewTitle, "\(details.frontTires ?? "")"))
            items.append(makeItem(VehicleDetails.Field.rearTires.hebrewTitle, "\(details.rearTires ?? "")"))
            items.append(makeItem(VehicleDetails.Field.fuelType.hebrewTitle, "\(details.fuelType ?? "")"))
            items.append(makeItem(VehicleDetails.Field.tradeName.hebrewTitle, "\(details.tradeName ?? "")"))
        }
        
        if let history = vehicleHistory.first {
            items.append(makeItem(VehicleHistory.Field.engineNumber.hebrewTitle, "\(history.engineNumber ?? "")"))
            items.append(makeItem(VehicleHistory.Field.rank.hebrewTitle, "\(history.rank ?? 0)"))
        }
        
        return items
    }
    
    func licensingTabBuilder(vehicleDetails: [VehicleDetails], vehicleHistory: [VehicleHistory]) -> [DisplayItem] {
        var items: [DisplayItem] = []
        
        if let details = vehicleDetails.first {
            items.append(makeItem(VehicleDetails.Field.lastInspectionDate.hebrewTitle, "\(details.lastInspectionDate ?? "")"))
            items.append(makeItem(VehicleDetails.Field.inspectionValidity.hebrewTitle, "\(details.inspectionValidity ?? "")"))
            items.append(makeItem(VehicleDetails.Field.ownershipType.hebrewTitle, "\(details.ownershipType ?? "")"))
            items.append(makeItem(VehicleDetails.Field.registrationDirective.hebrewTitle, "\(details.registrationDirective ?? 0)"))
            items.append(makeItem(VehicleDetails.Field.roadEntryDate.hebrewTitle, "\(details.roadEntryDate ?? "")"))
        }
        
        if let history = vehicleHistory.first {
            items.append(makeItem(VehicleHistory.Field.lastMileage.hebrewTitle, "\(history.lastMileage ?? 0)"))
            items.append(makeItem(VehicleHistory.Field.structureChangeFlag.hebrewTitle, "\(history.structureChangeFlag ?? 0)"))
            items.append(makeItem(VehicleHistory.Field.lpgInspectionFlag.hebrewTitle, "\(history.lpgInspectionFlag ?? 0)"))
            items.append(makeItem(VehicleHistory.Field.colorChangeFlag.hebrewTitle, "\(history.colorChangeFlag ?? 0)"))
            items.append(makeItem(VehicleHistory.Field.tireChangeFlag.hebrewTitle, "\(history.tireChangeFlag ?? 0)"))
            items.append(makeItem(VehicleHistory.Field.firstRegistrationDate.hebrewTitle, "\(history.firstRegistrationDate ?? "")"))
            items.append(makeItem(VehicleHistory.Field.originalityName.hebrewTitle, "\(history.originalityName ?? "")"))
            
        }
        
        return items
    }
    
    func safetyTabBuilder(vehicleDetails: [VehicleDetails], vehicleHistory: [VehicleHistory]) -> [DisplayItem] {
        var items: [DisplayItem] = []
        
        if let details = vehicleDetails.first {
            items.append(makeItem(VehicleDetails.Field.safetyLevel.hebrewTitle, "\(details.safetyLevel ?? 0)"))
        }
        
        if let history = vehicleHistory.first {
            
        }
        
        return items
    }
    
    func miscellaneousTabBuilder(disabledParkingPermit: [DisabledParkingPermit], carExists: Bool) -> [DisplayItem] {
        guard carExists == true else { return [] }
        
        var items: [DisplayItem] = []
        
        if let permit = disabledParkingPermit.first {
            items.append(makeItem(DisabledParkingPermit.Field.badgeTitle.hebrewTitle, DisabledParkingPermit.Field.yesBadge.hebrewTitle))
            items.append(makeItem(DisabledParkingPermit.Field.badgeCreationDate.hebrewTitle, "\(permit.badgeCreationDate ?? 0)"))
            items.append(makeItem(DisabledParkingPermit.Field.badgeType.hebrewTitle, "\(permit.badgeType ?? 0)"))
        } else {
            items.append(makeItem(DisabledParkingPermit.Field.badgeTitle.hebrewTitle, DisabledParkingPermit.Field.noBadge.hebrewTitle))
        }
        
        return items
    }
}
