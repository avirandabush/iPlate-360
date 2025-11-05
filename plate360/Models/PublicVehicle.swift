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
    
    enum Field: String, CaseIterable {
        case carNumber = "public.vehicle.field.carNumber"
        case vehicleTypeName = "public.vehicle.field.vehicleTypeName"
        case manufactureYear = "public.vehicle.field.manufactureYear"
        case totalWeight = "public.vehicle.field.totalWeight"
        case manufacturerName = "public.vehicle.field.manufacturerName"
        case color = "public.vehicle.field.color"
        case modelName = "public.vehicle.field.modelName"
        case tradeName = "public.vehicle.field.tradeName"
        case vehicleTypeEUName = "public.vehicle.field.vehicleTypeEUName"
        case cancellationName = "public.vehicle.field.cancellationName"
        case cancellationDate = "public.vehicle.field.cancellationDate"
        case validityDate = "public.vehicle.field.validityDate"
        case seatsCount = "public.vehicle.field.seatsCount"
        case seatsNextToDriver = "public.vehicle.field.seatsNextToDriver"
    }
}
