//
//  AnimationView.swift
//  BigProject
//
//  Created by beyza erdoğan on 22.01.2024.
//

import SwiftUI

struct AnimationView: View {

    @State private var circleColor: Color = .blue
    @State private var xPosition: CGFloat = 200
    @State private var yPosition: CGFloat = 400
    @State private var circleSize: CGFloat = 50
    @State private var shakeCount: CGFloat = 0

    var body: some View {
        VStack {
            Spacer()
            circle
            Spacer()
            Button("SHAKE") {
                withAnimation {
                    shakeCount = 4
                } completion: {
                    shakeCount = 0
                }
            }
            .padding(.bottom, 50)
            Button("MOVE") {
                withAnimation(.snappy(duration: 5)) {
                    moveCircle()
                    changeColor()
                }
//                moveCircle()
//                changeCircleSize()
            }
            .padding(.bottom, 50)
        }
        .ignoresSafeArea()
    }

    private var circle: some View {
        Circle()
            .frame(width: circleSize, height: circleSize)
//            .animation(.bouncy(duration: 1), value: circleSize)
            .foregroundColor(circleColor)
//            .animation(.smooth(duration:2), value: circleColor)
            .position(x: xPosition,y: yPosition)
            .modifier(ShakeAnimation(shakes: shakeCount))
//            .animation(.smooth(duration: 1), value: xPosition)
            .onTapGesture {
                withAnimation(.bouncy(duration: 1)) {
                    changeCircleSize()
                }
            }
    }

    private func changeColor() {
        circleColor = Color(
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1)
        )
    }

    private func moveCircle() {
        xPosition += Double.random(in: -40...40)
        yPosition += Double.random(in: -100...100)
    }

    private func changeCircleSize() {
        circleSize = Double.random(in: 40...240)
    }
}

#Preview {
    AnimationView()
}
