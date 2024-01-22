//
//  OtherSampleView.swift
//  BigProject
//
//  Created by beyza erdoğan on 22.01.2024.
//

import SwiftUI

struct OtherSampleView: View {
    @EnvironmentObject var data : DataExample

    var body: some View {
        Text("\(data.text) : \(data.counter)")
    }
}

struct OtherSampleView_Previews: PreviewProvider {
    static var previews: some View {
        OtherSampleView()
            .environmentObject(DataExample())
    }
}
