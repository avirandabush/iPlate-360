//
//  VehicleDetails.swift
//  plate360
//
//  Created by Aviran Dabush on 29/10/2025.
//

import Foundation

struct VehicleDetailsResponse: Codable {
    let result: VehicleDetailsResult
}

struct VehicleDetailsResult: Codable {
    let records: [VehicleDetails]
}

struct VehicleDetails: Codable {
    let id: Int?
    let carNumber: Int?
    let manufacturerCode: Int?
    let manufacturerName: String?
    let modelType: String?
    let modelCode: Int?
    let modelName: String?
    let trimLevel: String?
    let safetyLevel: Int?
    let emissionGroup: Int?
    let manufactureYear: Int?
    let engineModel: String?
    let lastInspectionDate: String?
    let inspectionValidity: String?
    let ownershipType: String?
    let chassisNumber: String?
    let colorCode: Int?
    let color: String?
    let frontTires: String?
    let rearTires: String?
    let fuelType: String?
    let registrationDirective: Int?
    let roadEntryDate: String?
    let tradeName: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case carNumber = "mispar_rechev"
        case manufacturerCode = "tozeret_cd"
        case manufacturerName = "tozeret_nm"
        case modelType = "sug_degem"
        case modelCode = "degem_cd"
        case modelName = "degem_nm"
        case trimLevel = "ramat_gimur"
        case safetyLevel = "ramat_eivzur_betihuty"
        case emissionGroup = "kvutzat_zihum"
        case manufactureYear = "shnat_yitzur"
        case engineModel = "degem_manoa"
        case lastInspectionDate = "mivchan_acharon_dt"
        case inspectionValidity = "tokef_dt"
        case ownershipType = "baalut"
        case chassisNumber = "misgeret"
        case colorCode = "tzeva_cd"
        case color = "tzeva_rechev"
        case frontTires = "zmig_kidmi"
        case rearTires = "zmig_ahori"
        case fuelType = "sug_delek_nm"
        case registrationDirective = "horaat_rishum"
        case roadEntryDate = "moed_aliya_lakvish"
        case tradeName = "kinuy_mishari"
    }
    
    enum Field: String, CaseIterable {
        case carNumber = "vehicle.details.field.carNumber"
        case manufacturerCode = "vehicle.details.field.manufacturerCode"
        case manufacturerName = "vehicle.details.field.manufacturerName"
        case modelType = "vehicle.details.field.modelType"
        case modelCode = "vehicle.details.field.modelCode"
        case modelName = "vehicle.details.field.modelName"
        case trimLevel = "vehicle.details.field.trimLevel"
        case safetyLevel = "vehicle.details.field.safetyLevel"
        case emissionGroup = "vehicle.details.field.emissionGroup"
        case manufactureYear = "vehicle.details.field.manufactureYear"
        case engineModel = "vehicle.details.field.engineModel"
        case lastInspectionDate = "vehicle.details.field.lastInspectionDate"
        case inspectionValidity = "vehicle.details.field.inspectionValidity"
        case ownershipType = "vehicle.details.field.ownershipType"
        case chassisNumber = "vehicle.details.field.chassisNumber"
        case colorCode = "vehicle.details.field.colorCode"
        case color = "vehicle.details.field.color"
        case frontTires = "vehicle.details.field.frontTires"
        case rearTires = "vehicle.details.field.rearTires"
        case fuelType = "vehicle.details.field.fuelType"
        case registrationDirective = "vehicle.details.field.registrationDirective"
        case roadEntryDate = "vehicle.details.field.roadEntryDate"
        case tradeName = "vehicle.details.field.tradeName"
    }
}
