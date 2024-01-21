//
//  CatsViewModel.swift
//  BigProject
//
//  Created by beyza erdoğan on 21.01.2024.
//

import Foundation

class CatsViewModel: ObservableObject{

    @Published var isLoading = true
    @Published var catsData: Cats = Cats([])
    @Published var imageViewPresented = false
    @Published var catIdChosen: String = ""
    private var dataSource = CatsDataSource()

    init() {
        dataSource.delegate = self
    }

    func loadCatsData(){
        dataSource.loadCatsData()
    }

    func imageTapped() {
        imageViewPresented = true
    }
}

extension CatsViewModel: CatsDataSourceDelegate{

    func catsDataLoaded(data: Cats) {
        isLoading = false
        catsData = data
    }

}
