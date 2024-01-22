//
//  SampleView.swift
//  BigProject
//
//  Created by beyza erdoğan on 22.01.2024.
//


import SwiftUI

struct SampleView: View {
    @ObservedObject var stuff: Stuff

    var body: some View {
        Text("\(stuff.counter)")
            .font(.system(size:40, weight: .bold))
    }
}

struct SampleView_Previews: PreviewProvider {
    static var previews: some View {
        SampleView(stuff: Stuff())
    }
}
