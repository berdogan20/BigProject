//
//  LocationHelperDelegate.swift
//  BigProject
//
//  Created by beyza erdoğan on 21.01.2024.
//

import CoreLocation
import Foundation

protocol LocationHelperDelegate: AnyObject {

    func locationReceived(location: CLLocation)
}
