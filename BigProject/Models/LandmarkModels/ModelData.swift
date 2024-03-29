//
//  ModelData.swift
//  BigProject
//
//  Created by beyza erdoğan on 21.01.2024.
//


import Foundation

/*
 * With Observation, a view in SwiftUI can support data changes
 * without using property wrappers or bindings.
 * SwiftUI watches for any observable property changes
 * that could affect a view, and displays the correct version of the view after a change.
 */
@Observable
class ModelData {
    var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")

    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
