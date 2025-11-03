//
//  LanguageManager.swift
//  plate360
//
//  Created by Aviran Dabush on 03/11/2025.
//

import Foundation

class LanguageManager {
    static let shared = LanguageManager()
    let isHebrew: Bool

    private init() {
        isHebrew = Locale.preferredLanguages.first?.hasPrefix("he") ?? false
    }
}
