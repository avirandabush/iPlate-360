//
//  DisabledParkingPermit.swift
//  plate360
//
//  Created by Aviran Dabush on 03/11/2025.
//

import Foundation

struct DisabledParkingPermitResponse: Codable {
    let result: DisabledParkingPermitResult
}

struct DisabledParkingPermitResult: Codable {
    let records: [DisabledParkingPermit]
}

struct DisabledParkingPermit: Codable {
    let id: Int
    let carNumber: Int
    let badgeCreationDate: Int?
    let badgeType: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case carNumber = "MISPAR RECHEV"
        case badgeCreationDate = "TAARICH HAFAKAT TAG"
        case badgeType = "SUG TAV"
    }
}

extension DisabledParkingPermit {
    enum Field: String, CaseIterable {
        case carNumber
        case badgeCreationDate
        case badgeType
        case noBadge
        case yesBadge
        case badgeTitle

        var hebrewTitle: String {
            switch self {
            case .carNumber: return "מספר רכב"
            case .badgeCreationDate: return "תאריך הפקה"
            case .badgeType: return "סוג תו"
            case .noBadge: return "אין תו"
            case .yesBadge: return "יש תו"
            case .badgeTitle: return "תו נכה"
            }
        }

        var englishTitle: String {
            switch self {
            case .carNumber: return "License Number"
            case .badgeCreationDate: return "Permiy Production Date"
            case .badgeType: return "Permit Type"
            case .noBadge: return "No Badge"
            case .yesBadge: return "Badge Exists"
            case .badgeTitle: return "No Badge"
            }
        }
    }
}
