//
//  BestSellersViewModel.swift
//  BigProject
//
//  Created by beyza erdoğan on 21.01.2024.
//

import Foundation

class BestSellersViewModel: ObservableObject {

    @Published var isLoading = true
    @Published var bestSellers: BestSellers = BestSellers(status: "", copyright: "", numResults: 0, lastModified: "", results: Results(listName: "", listNameEncoded: "", bestsellersDate: "", publishedDate: "", publishedDateDescription: "", nextPublishedDate: "", previousPublishedDate: "", displayName: "", normalListEndsAt: 0, updated: "", books: [], corrections: []))
    @Published var bookDetailPresented = false
    @Published var selectedBook: Book = Book(rank: 0, rankLastWeek: 0, weeksOnList: 0, asterisk: 0, dagger: 0, primaryIsbn10: "", primaryIsbn13: "", publisher: "", description: "", price: "", title: "", author: "", contributor: "", contributorNote: "", bookImage: "", bookImageWidth: 0, bookImageHeight: 0, amazonProductURL: "", ageGroup: "", bookReviewLink: "", firstChapterLink: "", sundayReviewLink: "", articleChapterLink: "", isbns: [], buyLinks: [], bookURI: "")
    private var dataSource = BestSellersDataSource()

    init() {
        dataSource.delegate = self
    }

    func loadBestSellers(){
        dataSource.loadBestSellersData()
    }

    func bookTapped() {
        bookDetailPresented = true
    }

}

extension BestSellersViewModel: BestSellersDataSourceDelegate {
    func bestSellersDataLoaded(data: BestSellers) {
        self.isLoading = false
        self.bestSellers = data
    }
}
