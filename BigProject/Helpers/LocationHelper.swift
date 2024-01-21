//
//  LocationHelper.swift
//  BigProject
//
//  Created by beyza erdoğan on 21.01.2024.
//

import CoreLocation
import Foundation

class LocationHelper: NSObject {
    private let locationManager = CLLocationManager()
    weak var delegate: LocationHelperDelegate?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.distanceFilter = 5
        locationManager.stopMonitoringVisits()
    }

    func getLocation() {
        locationManager.startUpdatingLocation()
    }

    func askForPermission() {
        locationManager.requestAlwaysAuthorization()
    }

    func startMonitoring() {
        let region = CLCircularRegion(
            center: .init(latitude: 41.206514179320244, longitude: 29.072266386350165),
            radius: 100,
            identifier: "Koc University"
        )
        locationManager.startMonitoring(for: region)
    }

}

extension LocationHelper: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        delegate?.locationReceived(location: locations[0])
    }

    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("Entered \(region.identifier)")
    }

    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("Exited \(region.identifier)")
    }

    func locationManager(_ manager: CLLocationManager, didVisit visit: CLVisit) {

    }
}
