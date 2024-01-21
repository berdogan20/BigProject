//
//  WeatherDataSourceDelegate.swift
//  BigProject
//
//  Created by beyza erdoğan on 21.01.2024.
//

import Foundation
protocol WeatherDataSourceDelegate {
    func weatherDataLoaded(data: Weather)
}
