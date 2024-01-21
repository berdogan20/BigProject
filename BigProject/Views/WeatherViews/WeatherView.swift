//
//  WeatherView.swift
//  BigProject
//
//  Created by beyza erdoğan on 21.01.2024.
//

import CoreLocation
import Foundation
import SwiftUI

struct WeatherView: View {
    var weather: Weather

    private var backgroundImage: Image {
        switch weather.weather[0].main {
        case "clear":
            return Image("sunny")
        case "rain":
            return Image("rainy")
        case "snow":
            return Image("snowy")
        case "cloud":
            return Image("cloudy")
        default:
            return Image("sunny")
        }
    }

    private var systemImage: Image {
        switch weather.weather[0].main {
        case "clear":
            return Image(systemName: "sun.max")
        case "rain":
            return Image(systemName: "cloud.drizzle")
        case "snow":
            return Image(systemName: "cloud.snow")
        case "cloud":
            return Image(systemName: "cloud")
        default:
            return Image(systemName: "sun.min")
        }
    }

    var body: some View {
        ZStack {
            backgroundImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)

            VStack(alignment: .leading) {
                HStack(spacing: .zero) {
                    Text(weather.name)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .shadow(radius: Radius.radius_5)
                        .padding(.leading, Spacing.spacing_4)
                    Spacer()
                    systemImage
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()
                }
                .padding(.trailing, Spacing.spacing_4)
                Spacer()
            }
        }
    }
}

#if DEBUG
struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: Weather(coord: Coord(lon: 0.00, lat: 0.00), weather: [WeatherElement(id: 0, main: "snow", description: "", icon: "")], main: Main(temp: 0.00, feelsLike: 0.00, tempMin: 0.00, tempMax: 0.00, pressure: 0, humidity: 0), visibility: 0, wind: Wind(speed: 0.00, deg: 0), sys: Sys(country: ""), name:"Istanbul"))
    }
}
#endif
