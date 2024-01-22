//
//  EnvironmentView.swift
//  BigProject
//
//  Created by beyza erdoğan on 22.01.2024.
//

import SwiftUI

// MainActor tells to perform on the main thread
@MainActor class DataExample : ObservableObject {
    @Published var text = "Counter"
    @Published var counter = 0
}

struct EnvironmentView: View {
    @StateObject var data = DataExample()

    var body: some View {
        VStack {
            TextBlockView()
            OtherSampleView()
        }
        .environmentObject(data)
    }
}


struct EnvironmentView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentView()
    }
}

