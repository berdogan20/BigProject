//
//  ThemePicker.swift
//  BigProject
//
//  Created by beyza erdoğan on 21.01.2024.
//

import SwiftUI

struct ThemePicker: View {

    /*
     * Try to maintain a single source of truth for every piece of data in your app.
     * Instead of creating a new source of truth for the theme picker,
     * you’ll use a binding that references a theme structure defined in the parent view.
     * This binding communicates changes to the theme within the theme picker
     * back to the parent view. Defining selection creates compiler errors
     * because the theme picker requires a binding.
     */
    @Binding var selection: Theme

    var body: some View {
        Picker("Theme", selection: $selection) {
            ForEach(Theme.allCases) { theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }
        .pickerStyle(.navigationLink)
    }
}

struct ThemePicker_Previews: PreviewProvider {
    static var previews: some View {
        ThemePicker(selection: .constant(.periwinkle))
    }
}
