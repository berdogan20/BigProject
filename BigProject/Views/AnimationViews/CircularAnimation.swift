//
//  CircularAnimation.swift
//  BigProject
//
//  Created by beyza erdoğan on 22.01.2024.
//

import Foundation
import SwiftUI

struct ShakeAnimation: AnimatableModifier {

    var shakes: CGFloat = 0

    var animatableData: CGFloat {
        get {
            shakes
        } set {
            shakes = newValue
        }
    }

    func body(content: Content) -> some View {
        content
            .offset(x: sin(shakes * .pi * 2) * 5)
    }

}
