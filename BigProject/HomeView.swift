//
//  ContentView.swift
//  BigProject
//
//  Created by beyza erdoğan on 21.01.2024.
//

import SwiftUI

struct HomeView: View {
    @State private var scrums = DailyScrum.sampleData
    var body: some View {
        TabView {
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
