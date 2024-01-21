//
//  AboutMerTabView.swift
//  BigProject
//
//  Created by beyza erdoğan on 21.01.2024.
//

import SwiftUI

struct AboutMerTabView: View {
    var body: some View {
        TabView {
            AboutMeHomeView()
                .tabItem {
                    Label("Home", systemImage: "person")
                }

            StoryView()
                .tabItem {
                    Label("Story", systemImage: "book")
                }

            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }

            FunFactsView()
                .tabItem {
                    Label("Fun Facts", systemImage: "hand.thumbsup")
                }
        }

    }
}

#Preview {
    AboutMerTabView()
}
