//
//  StoryView.swift
//  BigProject
//
//  Created by beyza erdoğan on 21.01.2024.
//

import SwiftUI

struct StoryView2: View {

    var body: some View {
        NavigationStack {
            StoryPageView(story: story, pageIndex: 0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView2()
    }
}
