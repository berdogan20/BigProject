//
//  StepperDS.swift
//  BigProject
//
//  Created by beyza erdoğan on 22.01.2024.
//

import SwiftUI

struct StepperDS: View {

    @Binding private var value: Double
    private let minValue: Int
    private let maxValue: Int

    init(
        value: Binding<Double>,
        minValue: Int,
        maxValue: Int
    ) {
        _value = value
        self.minValue = minValue
        self.maxValue = maxValue
    }

    var body: some View {
        VStack(spacing: Spacing.spacing_0_5) {
            HStack(spacing: .zero) {
                Text(String(valueInInt))
            }
            Slider(
                value: $value,
                in: Double(minValue)...Double(maxValue),
                step: 1.0
            )
        }
    }

    private var valueInInt: Int {
        Int(value)
    }
}

#Preview {
    StepperDS(
        value: .constant(40),
        minValue: 0,
        maxValue: 100
    )
}
