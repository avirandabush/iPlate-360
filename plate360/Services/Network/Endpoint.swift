//
//  Endpoint.swift
//  plate360
//
//  Created by Aviran Dabush on 29/10/2025.
//

import Foundation

struct Endpoint {
    static let baseURL = "https://data.gov.il/api/3/action/"
    
    static func vehicle(number: String) -> URL? {
        let urlString = "\(baseURL)datastore_search?resource_id=053cea08-09bc-40ec-8f7a-156f0677aff3&q=\(number)"
        return URL(string: urlString)
    }
}
