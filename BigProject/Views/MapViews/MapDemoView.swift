//
//  MapDemoView.swift
//  BigProject
//
//  Created by beyza erdoğan on 21.01.2024.
//
import MapKit
import PhotosUI
import SwiftUI

struct MapDemoView: View {

    @StateObject var viewModel: MapDemoViewModel = MapDemoViewModel()
    @State private var mapCameraPosition : MapCameraPosition = .automatic

    var body: some View {
        ZStack {
            // Region
            /*Map(
                initialPosition: .region(.init(
                    center: .init(
                        latitude: 37.8026068,
                        longitude: -122.4058651
                    ),
                    latitudinalMeters: 150,
                    longitudinalMeters: 150
                ))
            )*/

            // MKMapItem
            /*Map(position: $mapCameraPosition)
                .onAppear {
                    mapCameraPosition = .item(viewModel.edinburghCastle)
                }*/

            Map(position: $mapCameraPosition) {
                Annotation(
                    "Koc University",
                    coordinate: .init(
                        latitude: 37.8028,
                        longitude: -122.42
                    )
                ) {
                    Image(systemName: "graduationcap.circle")
                        .symbolEffect(.pulse)
                }
            }
            .onAppear {
                mapCameraPosition = .camera(
                    .init(
                        centerCoordinate: .init(
                            latitude: 37.8026068,
                            longitude: -122.4058651
                        ),
                        distance: 500,
                        heading: 130,
                        pitch: 60
                    )
                )
            }
            VStack {
                Spacer()
                Button("Go to Palace of Fine Arts") {
                    withAnimation {
                        mapCameraPosition = .camera(
                            .init(
                                centerCoordinate: .init(
                                    latitude: 37.803074810,
                                    longitude: -122.44845531
                                ),
                                distance: 800,
                                heading: 60,
                                pitch: 45
                            )
                        )
                    }
                }
                .foregroundColor(.white)
                .padding(Spacing.spacing_2)
                .background(Color.black)
                .cornerRadius(Radius.radius_3)

                Button("Go to Coit Tower") {
                    withAnimation {
                        mapCameraPosition = .camera(
                            .init(
                                centerCoordinate: .init(
                                    latitude: 37.8026068,
                                    longitude: -122.4058651
                                ),
                                distance: 500,
                                heading: 130,
                                pitch: 60
                            )
                        )
                    }
                }
                .foregroundColor(.white)
                .padding(Spacing.spacing_2)
                .background(Color.black)
                .cornerRadius(Radius.radius_3)

                Button("Go to Edinburg Castle") {
                    withAnimation {
                        mapCameraPosition = .camera(
                            .init(
                                centerCoordinate: .init(
                                    latitude: 55.948635,
                                    longitude: -3.200433
                                ),
                                distance: 500,
                                heading: 130,
                                pitch: 60
                            )
                        )
                    }
                }
                .foregroundColor(.white)
                .padding(Spacing.spacing_2)
                .background(Color.black)
                .cornerRadius(Radius.radius_3)
            }
        }
    }
}

#Preview {
    MapDemoView()
}
