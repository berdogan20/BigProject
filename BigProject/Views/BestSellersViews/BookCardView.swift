//
//  BookCardView.swift
//  BigProject
//
//  Created by beyza erdoğan on 21.01.2024.
//

import SwiftUI

struct BookCardView: View {

    let book: Book

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: book.bookImage)) { phase in
                if let image = phase.image {
                    image.resizable()
                        .frame(width:100, height:100) // Displays the loaded image.
                } else if phase.error != nil {
                        Text("Image not found.") // Indicates an error.
                        .frame(width:100, height:100)
                } else {
                    Loading() // Acts as a placeholder.
                }
            }
            VStack (alignment: .leading) {
                HStack (spacing: .zero) {
                    ForEach(0..<book.rankLastWeek, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                }
                .padding(.bottom, Spacing.spacing_1)
                Text(book.title)
                    .font(.headline)
                Text(book.publisher)
                    .font(.caption)
                Spacer()
                Text(book.description)
                    .frame(maxWidth: 250)
            }
            .padding()
        }

    }
}
