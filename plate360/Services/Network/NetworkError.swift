//
//  NetworkError.swift
//  plate360
//
//  Created by Aviran Dabush on 29/10/2025.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case requestFailed
    case decodingFailed
    case unknown
}
