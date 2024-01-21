//
//  CatImages.swift
//  BigProject
//
//  Created by beyza erdoğan on 21.01.2024.
//

import Foundation
import UIKit

typealias CatImages = [CatImageElement]

// MARK: - CatImageElement
struct CatImageElement: Codable, Hashable {
    let url: String
}


