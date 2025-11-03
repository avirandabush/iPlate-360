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
    let rank: Int?

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
        case rank
    }
}

extension VehicleHistory {
    enum Field: String, CaseIterable {
        case licenseNumber
        case engineNumber
        case lastMileage
        case structureChangeFlag
        case lpgInspectionFlag
        case colorChangeFlag
        case tireChangeFlag
        case firstRegistrationDate
        case originalityName
        case rank

        var hebrewTitle: String {
            switch self {
            case .licenseNumber: return "מספר רכב"
            case .engineNumber: return "מספר מנוע"
            case .lastMileage: return "קילומטראז׳ אחרון"
            case .structureChangeFlag: return "שינוי מבנה"
            case .lpgInspectionFlag: return "בדיקה בגפ״ם"
            case .colorChangeFlag: return "שינוי צבע"
            case .tireChangeFlag: return "שינוי צמיגים"
            case .firstRegistrationDate: return "רישום ראשון"
            case .originalityName: return "מקוריות"
            case .rank: return "דירוג"
            }
        }

        var englishTitle: String {
            switch self {
            case .licenseNumber: return "License Number"
            case .engineNumber: return "Engine Number"
            case .lastMileage: return "Last Mileage"
            case .structureChangeFlag: return "Structure Change"
            case .lpgInspectionFlag: return "LPG Inspection"
            case .colorChangeFlag: return "Color Change"
            case .tireChangeFlag: return "Tire Change"
            case .firstRegistrationDate: return "First Registration"
            case .originalityName: return "Originality"
            case .rank: return "Rank"
            }
        }
    }
}

