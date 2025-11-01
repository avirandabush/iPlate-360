//
//  Vehicle.swift
//  plate360
//
//  Created by Aviran Dabush on 29/10/2025.
//

import Foundation

struct VehicleResponse: Codable {
    let result: VehicleResult
}

struct VehicleResult: Codable {
    let records: [Vehicle]
}

struct Vehicle: Codable {
    let id: Int
    let carNumber: Int
    let manufacturerCode: Int
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
}
