//
//  PublicVehicle.swift
//  plate360
//
//  Created by Aviran Dabush on 02/11/2025.
//

import Foundation

struct PublicVehicleResponse: Codable {
    let result: PublicVehicleResult
}

struct PublicVehicleResult: Codable {
    let records: [PublicVehicle]
}

struct PublicVehicle: Codable {
    let id: Int
    let carNumber: Int
    let vehicleTypeCode: Int?
    let vehicleTypeName: String?
    let manufactureYear: Int?
    let totalWeight: Int?
    let manufacturerCode: Int?
    let manufacturerName: String?
    let colorCode: Int?
    let color: String?
    let modelCode: Int?
    let modelName: String?
    let tradeName: String?
    let vehicleTypeEUCode: String?
    let vehicleTypeEUName: String?
    let cancellationCode: String?
    let cancellationName: String?
    let cancellationDate: String?
    let validityDate: String?
    let seatsCount: Int?
    let seatsNextToDriver: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case carNumber = "mispar_rechev"
        case vehicleTypeCode = "sug_rechev_cd"
        case vehicleTypeName = "sug_rechev_nm"
        case manufactureYear = "shnat_yitzur"
        case totalWeight = "mishkal_kolel"
        case manufacturerCode = "tozeret_cd"
        case manufacturerName = "tozeret_nm"
        case colorCode = "tzeva_cd"
        case color = "tzeva_rechev"
        case modelCode = "degem_cd"
        case modelName = "degem_nm"
        case tradeName = "kinuy_mishari"
        case vehicleTypeEUCode = "sug_rechev_EU_cd"
        case vehicleTypeEUName = "sug_rechev_EU_nm"
        case cancellationCode = "bitul_cd"
        case cancellationName = "bitul_nm"
        case cancellationDate = "bitul_dt"
        case validityDate = "tokef_dt"
        case seatsCount = "mispar_mekomot"
        case seatsNextToDriver = "mispar_mekomot_leyd_nahag"
    }
}

extension PublicVehicle {
    enum Field: String, CaseIterable {
        case carNumber
        case vehicleTypeName
        case manufactureYear
        case totalWeight
        case manufacturerName
        case color
        case modelName
        case tradeName
        case vehicleTypeEUName
        case cancellationName
        case cancellationDate
        case validityDate
        case seatsCount
        case seatsNextToDriver

        var hebrewTitle: String {
            switch self {
            case .carNumber: return "מספר רכב"
            case .vehicleTypeName: return "סוג רכב"
            case .manufactureYear: return "שנת ייצור"
            case .totalWeight: return "משקל כולל"
            case .manufacturerName: return "יצרן"
            case .color: return "צבע"
            case .modelName: return "דגם"
            case .tradeName: return "כינוי מסחרי"
            case .vehicleTypeEUName: return "סוג רכב (EU)"
            case .cancellationName: return "סטטוס ביטול"
            case .cancellationDate: return "תאריך ביטול"
            case .validityDate: return "תוקף רישוי"
            case .seatsCount: return "מספר מקומות"
            case .seatsNextToDriver: return "מקומות ליד לנהג"
            }
        }

        var englishTitle: String {
            switch self {
            case .carNumber: return "License Number"
            case .vehicleTypeName: return "Vehicle Type"
            case .manufactureYear: return "Manufacture Year"
            case .totalWeight: return "Total Weight"
            case .manufacturerName: return "Manufacturer"
            case .color: return "Color"
            case .modelName: return "Model"
            case .tradeName: return "Trade Name"
            case .vehicleTypeEUName: return "Vehicle Type (EU)"
            case .cancellationName: return "Cancellation Status"
            case .cancellationDate: return "Cancellation Date"
            case .validityDate: return "License Validity"
            case .seatsCount: return "Seats Count"
            case .seatsNextToDriver: return "Seats Next To Driver"
            }
        }
    }
}

