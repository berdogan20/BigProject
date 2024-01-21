//
//  ContentView.swift
//  BigProject
//
//  Created by beyza erdoğan on 21.01.2024.
//

import SwiftUI

struct HomeView: View {
    @State private var scrums = DailyScrum.sampleData
    @State private var modelData = ModelData()

    var body: some View {
        TabView {
            LocationView()
                .tabItem {
                    Label("Weather", systemImage: "sun.min")
                }
            ContentView()
                .environment(modelData)
                .tabItem {
                    Label("Landmark", systemImage: "globe.central.south.asia")
                }
            MapDemoView()
                .tabItem {
                    Label("Map", systemImage: "map")
                }
            ScrumsView(scrums: $scrums)
                .tabItem {
                    Label("Home", systemImage: "person")
                }

            StoryView()
                .tabItem {
                    Label("About me", systemImage: "pencil")
                }

            StoryView2()
                .tabItem {
                    Label("Story", systemImage: "star")
                }

            CatsView()
                .tabItem {
                    Label("Cats", systemImage: "cat")
                }
            BestSellersView()
                .tabItem {
                    Label("Best Sellers", systemImage: "book")
                }
        }

    }
}

#Preview {
    HomeView()
}
