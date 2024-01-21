//
//  MapDemoViewModel.swift
//  BigProject
//
//  Created by beyza erdoğan on 21.01.2024.
//

import MapKit
import PhotosUI
import SwiftUI

class MapDemoViewModel: ObservableObject {
    @Published var edinburghCastle: MKMapItem = .init(placemark: .init(
        coordinate: .init(
            latitude: 55.948635,
            longitude: -3.200433
    )))

    @Published var coitTower: MKMapItem = .init(placemark: .init(
        coordinate: .init(
            latitude: 37.8026068,
            longitude: -122.4058651
        )))

    @Published var palaceOfFineArts: MKMapItem =
        .init(placemark: .init(
            coordinate: .init(
                latitude: 37.803074810,
                longitude: -122.44845531
            )))

    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.009, longitudeDelta: 0.009)
    )
}
