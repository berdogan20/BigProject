//
//  Loading.swift
//  BigProject
//
//  Created by beyza erdoğan on 21.01.2024.
//

import SwiftUI

struct Loading: View {
    var body: some View {
        VStack(spacing: Spacing.spacing_1){
            ProgressView()
            Text("Loading...")
        }
    }
}

#Preview {
    Loading()
}
