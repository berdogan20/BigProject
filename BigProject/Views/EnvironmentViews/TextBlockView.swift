//
//  TextBlockView.swift
//  BigProject
//
//  Created by beyza erdoğan on 22.01.2024.
//


import SwiftUI

struct TextBlockView: View {
    @EnvironmentObject var data: DataExample

    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 200, height: 60)
                .foregroundColor(.blue)
                .cornerRadius(8)
            Text("\(data.text) : \(data.counter)")
                .foregroundColor(.white)
        }
        .onTapGesture {
            data.counter += 1
        }
    }
}

struct TextBlockView_Previews: PreviewProvider {
    static var previews: some View {
        TextBlockView()
            .environmentObject(DataExample())
    }
}
