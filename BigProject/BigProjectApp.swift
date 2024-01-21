//
//  BigProjectApp.swift
//  BigProject
//
//  Created by beyza erdoğan on 21.01.2024.
//

import SwiftUI

@main
struct BigProjectApp: App {
    @State private var scrums = DailyScrum.sampleData
    var body: some Scene {
        WindowGroup {
            HomeView()
            //ScrumsView(scrums: $scrums)
        }
    }
}
