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
}

extension VehicleDetails {
    enum Field: String, CaseIterable {
        case carNumber
        case manufacturerCode
        case manufacturerName
        case modelType
        case modelCode
        case modelName
        case trimLevel
        case safetyLevel
        case emissionGroup
        case manufactureYear
        case engineModel
        case lastInspectionDate
        case inspectionValidity
        case ownershipType
        case chassisNumber
        case colorCode
        case color
        case frontTires
        case rearTires
        case fuelType
        case registrationDirective
        case roadEntryDate
        case tradeName

        var hebrewTitle: String {
            switch self {
            case .carNumber: return "מספר רכב"
            case .manufacturerCode: return "קוד יצרן"
            case .manufacturerName: return "יצרן"
            case .modelType: return "סוג דגם"
            case .modelCode: return "קוד דגם"
            case .modelName: return "שם דגם"
            case .trimLevel: return "רמת גימור"
            case .safetyLevel: return "רמת אבזור בטיחותי"
            case .emissionGroup: return "קבוצת זיהום"
            case .manufactureYear: return "שנת ייצור"
            case .engineModel: return "דגם מנוע"
            case .lastInspectionDate: return "מבחן אחרון"
            case .inspectionValidity: return "תוקף מבחן"
            case .ownershipType: return "סוג בעלות"
            case .chassisNumber: return "מספר שלדה"
            case .colorCode: return "קוד צבע"
            case .color: return "צבע"
            case .frontTires: return "צמיגים קדמיים"
            case .rearTires: return "צמיגים אחוריים"
            case .fuelType: return "סוג דלק"
            case .registrationDirective: return "הוראת רישום"
            case .roadEntryDate: return "מועד עלייה לכביש"
            case .tradeName: return "כינוי מסחרי"
            }
        }

        var englishTitle: String {
            switch self {
            case .carNumber: return "License Number"
            case .manufacturerCode: return "Manufacturer Code"
            case .manufacturerName: return "Manufacturer"
            case .modelType: return "Model Type"
            case .modelCode: return "Model Code"
            case .modelName: return "Model Name"
            case .trimLevel: return "Trim Level"
            case .safetyLevel: return "Safety Equipment Level"
            case .emissionGroup: return "Emission Group"
            case .manufactureYear: return "Manufacture Year"
            case .engineModel: return "Engine Model"
            case .lastInspectionDate: return "Last Inspection Date"
            case .inspectionValidity: return "Inspection Validity"
            case .ownershipType: return "Ownership Type"
            case .chassisNumber: return "Chassis Number"
            case .colorCode: return "Color Code"
            case .color: return "Color"
            case .frontTires: return "Front Tires"
            case .rearTires: return "Rear Tires"
            case .fuelType: return "Fuel Type"
            case .registrationDirective: return "Registration Directive"
            case .roadEntryDate: return "Road Entry Date"
            case .tradeName: return "Trade Name"
            }
        }
    }
}

