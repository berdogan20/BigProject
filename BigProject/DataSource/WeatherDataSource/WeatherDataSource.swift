//
//  WeatherDataSource.swift
//  BigProject
//
//  Created by beyza erdoğan on 21.01.2024.
//

import Foundation

struct WeatherDataSource {

    private let baseURL = "https://api.openweathermap.org/data/2.5/weather?appid=fd278e3218d9cb147110dd5e5eb7bd60&units=metric&"
    var delegate: WeatherDataSourceDelegate?

    func loadWeatherData(lat: String, lon: String){

        // get shared URL session
        let session = URLSession.shared

        // create a URL
        // returns an optional String
        guard let url = URL(string: String("\(baseURL)lat=\(lat)&lon=\(lon)")) else {return}

        // create a URL request
        var request = URLRequest(url: url)

        // set the HTTP verb
        request.httpMethod = "GET"

        // set header for JSON
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")


        // create a data task
        let dataTask = session.dataTask(with: request) { data, response, error in
            guard let data else {return}    // if the data is nil, return

            //print(String(decoding: data, as: UTF8.self))   // if you receive completion handler, do this

            let decoder = JSONDecoder()
            do{
                let weatherData = try decoder.decode(Weather.self, from: data)
                //print(weatherData)

                DispatchQueue.main.async {
                    // put to main thread
                    delegate?.weatherDataLoaded(data: weatherData)
                }
            }
            catch{
                print(error)
            }
        }

        // resume the data task
        dataTask.resume()
    }

}
