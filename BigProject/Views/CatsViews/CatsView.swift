//
//  CatsView.swift
//  BigProject
//
//  Created by beyza erdoğan on 21.01.2024.
//

import SwiftUI

struct CatsView: View {

    @StateObject private var viewModel = CatsViewModel()

    var body: some View {
        if (viewModel.isLoading){
            Loading()
                .onAppear{  // Adds an action to perform before this view appears.
                    viewModel.loadCatsData()
                }
        }
        else{
            NavigationStack {
                List{
                    Section{
                        ForEach(viewModel.catsData, id:\.self){ cat in
                            Text(cat.name)
                                .foregroundColor(.black)
                                .onTapGesture {
                                    viewModel.imageTapped()
                                    viewModel.catIdChosen = cat.id
                                }
                        }
                        .listRowBackground(
                            Capsule()
                                .fill(Color(white: 1, opacity:0.6))
                                .padding(.vertical, 6)
                                .padding(.horizontal, 1)
                                .frame(height: 55)
                        )
                        .listRowSeparator(.hidden)
                        .sheet(isPresented: $viewModel.imageViewPresented, content: {
                            CatImagesView(id: viewModel.catIdChosen)
                        })
                    } header: {
                        Text("Cats")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                            .shadow(radius: Radius.radius_3)
                            .padding(.bottom, Spacing.spacing_0_5)

                    } footer: {
                        Text("Unleash the World of Cats!")
                    }
                    .listRowInsets(.init(top: 0, leading: 40, bottom: 0, trailing: 40))
                }
                .environment(\.defaultMinListRowHeight, 50)
                //.environment(\.defaultMinListHeaderHeight, 50)
                .scrollContentBackground(.hidden)
                .background{
                    Image("cats")
                        .resizable()
                        .scaledToFill()
                        .blur(radius: 0.1)
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                }
            }
        }
    }
}

#Preview {
    CatsView()
}
