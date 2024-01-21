//
//  Cats.swift
//  BigProject
//
//  Created by beyza erdoğan on 21.01.2024.
//

import Foundation

typealias Cats = [CatElement]

// MARK: - CatElement
struct CatElement: Codable, Hashable {
    let id, name, temperament, origin: String
    let description, lifeSpan: String
    let adaptability, affectionLevel, childFriendly, dogFriendly: Int
    let energyLevel, healthIssues, intelligence, socialNeeds: Int
    let strangerFriendly: Int

    enum CodingKeys: String, CodingKey {
        case id, name, temperament, origin, description
        case lifeSpan = "life_span"
        case adaptability
        case affectionLevel = "affection_level"
        case childFriendly = "child_friendly"
        case dogFriendly = "dog_friendly"
        case energyLevel = "energy_level"
        case healthIssues = "health_issues"
        case intelligence
        case socialNeeds = "social_needs"
        case strangerFriendly = "stranger_friendly"
    }
}
