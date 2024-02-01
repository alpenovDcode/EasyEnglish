//
//  Word.swift
//  EasyEnglish
//
//  Created by Альпеша on 31.01.2024.
//

import SwiftUI
import Foundation

struct Word: Identifiable, Decodable {
    let id = UUID()
    let word: String
    let translation: String
    let description: String

    enum CodingKeys: String, CodingKey {
        case word
        case translation
        case description
    }
}
