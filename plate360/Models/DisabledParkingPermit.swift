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
    
    enum Field: String, CaseIterable {
        case carNumber = "disable.parking.permit.field.carNumber"
        case badgeCreationDate = "disable.parking.permit.field.badgeCreationDate"
        case badgeType = "disable.parking.permit.field.badgeType"
        case noBadge = "disable.parking.permit.field.noBadge"
        case yesBadge = "disable.parking.permit.field.yesBadge"
        case badgeTitle = "disable.parking.permit.field.badgeTitle"
    }
}
