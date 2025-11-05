//
//  VehicleHistory.swift
//  plate360
//
//  Created by Aviran Dabush on 02/11/2025.
//

import Foundation

struct VehicleHistoryResponse: Codable {
    let result: VehicleHistoryResult
}

struct VehicleHistoryResult: Codable {
    let records: [VehicleHistory]
}

struct VehicleHistory: Codable {
    let id: Int?
    let licenseNumber: Int?
    let engineNumber: String?
    let lastMileage: Int?
    let structureChangeFlag: Int?
    let lpgInspectionFlag: Int?
    let colorChangeFlag: Int?
    let tireChangeFlag: Int?
    let firstRegistrationDate: String?
    let originalityName: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case licenseNumber = "mispar_rechev"
        case engineNumber = "mispar_manoa"
        case lastMileage = "kilometer_test_aharon"
        case structureChangeFlag = "shinui_mivne_ind"
        case lpgInspectionFlag = "gapam_ind"
        case colorChangeFlag = "shnui_zeva_ind"
        case tireChangeFlag = "shinui_zmig_ind"
        case firstRegistrationDate = "rishum_rishon_dt"
        case originalityName = "mkoriut_nm"
    }
    
    enum Field: String, CaseIterable {
        case licenseNumber = "vehicle.history.field.licenseNumber"
        case engineNumber = "vehicle.history.field.engineNumber"
        case lastMileage = "vehicle.history.field.lastMileage"
        case structureChangeFlag = "vehicle.history.field.structureChangeFlag"
        case lpgInspectionFlag = "vehicle.history.field.lpgInspectionFlag"
        case colorChangeFlag = "vehicle.history.field.colorChangeFlag"
        case tireChangeFlag = "vehicle.history.field.tireChangeFlag"
        case firstRegistrationDate = "vehicle.history.field.firstRegistrationDate"
        case originalityName = "vehicle.history.field.originalityName"
    }
}
