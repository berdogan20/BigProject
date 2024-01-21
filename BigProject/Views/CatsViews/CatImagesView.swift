//
//  CatImagesView.swift
//  BigProject
//
//  Created by beyza erdoğan on 21.01.2024.
//

import SwiftUI

struct CatImagesView: View {

    @StateObject private var viewModel = CatImagesViewModel()
    private var id: String

    init(id: String) {
        self.id = id
    }

    var body: some View {
        if (viewModel.isLoading){
            Loading()
                .onAppear{  // Adds an action to perform before this view appears.
                    viewModel.loadCatImages(id: id)
                }
        }
        else{
            ScrollView {
                ForEach(viewModel.catImages, id:\.self){ catElement in
                    AsyncImage(url: URL(string: catElement.url)) { catElement in
                        if let image = catElement.image {
                            image.resizable()
                                .frame(width:300, height:300)
                                .cornerRadius(Radius.radius_5)
                        } else if catElement.error != nil {
                                Text("Image not found.")
                                .frame(width:300, height:300)
                        } else {
                            Loading() // Acts as a placeholder.
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    CatImagesView(id: "beng")
}
