//
//  BestSellersView.swift
//  BigProject
//
//  Created by beyza erdoğan on 21.01.2024.
//

import SwiftUI

struct BestSellersView: View {

    @StateObject private var viewModel = BestSellersViewModel()

    var body: some View {
        if viewModel.isLoading {
            Loading()
                .onAppear {
                    viewModel.loadBestSellers()
                }
        } else {
            List {
                ForEach(viewModel.bestSellers.results.books, id: \.self) { book in
                    BookCardView(book: book)
                    .listRowBackground(
                        Rectangle()
                            .fill(Color(white: 1, opacity: 0.6))
                            .frame(height: 350)
                            .cornerRadius(Radius.radius_5)
                    )
                    .padding(.vertical, Spacing.spacing_4 * 2)
                    .onTapGesture {
                        viewModel.selectedBook = book
                        viewModel.bookTapped()
                    }
                }
                .sheet(isPresented: $viewModel.bookDetailPresented, content: {
                    BookDetailView(book: viewModel.selectedBook)
                })
            }
            .listRowSeparator(.hidden)
            .scrollContentBackground(.hidden)
            .background {
                Image("library")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }

}

#Preview {
    BestSellersView()
}
