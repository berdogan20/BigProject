//
//  LocationViewModel.swift
//  BigProject
//
//  Created by beyza erdoğan on 21.01.2024.
//

import CoreLocation
import Foundation
import SwiftUI

class LocationViewModel: ObservableObject {

    @Published var location: CLLocation?
    private let locationHelper = LocationHelper()

    init() {
        locationHelper.delegate = self
    }

    func getLocation() {
        locationHelper.getLocation()
    }

    func askForPermission() {
        locationHelper.askForPermission()
    }

}

extension LocationViewModel: LocationHelperDelegate {
    func locationReceived(location: CLLocation) {
        self.location = location
    }
}
