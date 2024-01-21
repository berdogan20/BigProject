//
//  WeatherViewModel.swift
//  BigProject
//
//  Created by beyza erdoğan on 21.01.2024.
//

import Foundation

class WeatherViewModel: ObservableObject{

    @Published var isLoading = true
    @Published var weatherData: Weather = Weather(coord: Coord(lon: 0.00, lat: 0.00), weather: [], main: Main(temp: 0.00, feelsLike: 0.00, tempMin: 0.00, tempMax: 0.00, pressure: 0, humidity: 0), visibility: 0, wind: Wind(speed: 0.00, deg: 0), sys: Sys(country: ""), name:"")
    @Published var lat: String = "28.4"
    @Published var lon: String = "41.2"

    private var dataSource = WeatherDataSource()

    init() {
        dataSource.delegate = self
    }

    func loadWeatherData(){
        dataSource.loadWeatherData(lat: lat, lon: lon)
    }

    func setLocation(lat: Double, lon: Double) {
        self.lat = String(lat)
        self.lon = String(lon)
    }

}

extension WeatherViewModel: WeatherDataSourceDelegate {
    func weatherDataLoaded(data: Weather) {
        isLoading = false
        weatherData = data
    }
}
