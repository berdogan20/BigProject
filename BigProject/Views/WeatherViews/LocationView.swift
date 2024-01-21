//
//  WeatherView.swift
//  BigProject
//
//  Created by beyza erdoğan on 21.01.2024.
//

import CoreLocation
import Foundation
import SwiftUI

struct LocationView: View {

    @StateObject private var locationViewModel = LocationViewModel()
    @StateObject private var weatherViewModel = WeatherViewModel()

    var body: some View {
        ZStack {
            Image("weather")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Button("Get Location") {
                    locationViewModel.askForPermission()
                    locationViewModel.getLocation()
                    if let location = locationViewModel.location {
                        weatherViewModel.setLocation(lat: location.coordinate.latitude, lon: location.coordinate.longitude)
                    }
                }
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(Radius.radius_2)
                locationView
            }
            .padding()
        }
    }

    private var locationView: some View {
        VStack(spacing: .zero) {
            HStack(spacing: .zero) {
                if let location = locationViewModel.location {
                    if (weatherViewModel.isLoading){
                        Loading()
                            .onAppear{
                                weatherViewModel.loadWeatherData()
                            }
                    }
                    else {
                        // Text(String(weatherViewModel.weatherData.main.temp))

                    }
                }
            }
        }
    }

}

#Preview {
    LocationView()
}
