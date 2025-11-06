//
//  DirectionManager.swift
//  plate360
//
//  Created by Aviran Dabush on 03/11/2025.
//

import Foundation

class DirectionManager {
    static let shared = DirectionManager()
    let isRTL: Bool

    private init() {
        isRTL = Locale.preferredLanguages.first?.hasPrefix("he") ?? false
    }
}
