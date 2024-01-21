//
//  CatImagesViewModel.swift
//  BigProject
//
//  Created by beyza erdoğan on 21.01.2024.
//

import Foundation

class CatImagesViewModel: ObservableObject{

    @Published var isLoading = true
    @Published var catImages: CatImages = CatImages()
    private var dataSource = CatImagesDataSource()

    init() {
        dataSource.delegate = self
    }

    func loadCatImages(id: String){
        dataSource.loadCatImages(id: id)
    }

}

extension CatImagesViewModel: CatImagesDataSourceDelegate{

    func catImagesLoaded(data: CatImages) {
        isLoading = false
        catImages = data
    }

}
