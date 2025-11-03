//
//  Endpoint.swift
//  plate360
//
//  Created by Aviran Dabush on 29/10/2025.
//

import Foundation

struct Endpoint {
    static let baseURL = "https://data.gov.il/api/3/action/"
    
    static func vehicleDetails(number: String) -> URL? {
        let urlString = "\(baseURL)datastore_search?resource_id=053cea08-09bc-40ec-8f7a-156f0677aff3&q=\(number)"
        return URL(string: urlString)
    }
    
    static func publicVehicle(number: String) -> URL? {
        let urlString = "\(baseURL)datastore_search?resource_id=cf29862d-ca25-4691-84f6-1be60dcb4a1e&q=\(number)"
        return URL(string: urlString)
    }
    
    static func vehicleHistory(number: String) -> URL? {
        let urlString = "\(baseURL)datastore_search?resource_id=56063a99-8a3e-4ff4-912e-5966c0279bad&q=\(number)"
        return URL(string: urlString)
    }
}
