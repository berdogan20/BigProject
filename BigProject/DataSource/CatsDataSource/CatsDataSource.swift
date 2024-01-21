//
//  CatsDataSource.swift
//  BigProject
//
//  Created by beyza erdoğan on 21.01.2024.
//

import Foundation

struct CatsDataSource{

    private let baseURL = "https://api.thecatapi.com/v1/breeds"
    var delegate: CatsDataSourceDelegate?

    func loadCatsData(){

        // get shared URL session
        let session = URLSession.shared

        // create a URL
        // returns an optional String
        guard let url = URL(string: baseURL) else {return}

        // create a URL request
        var request = URLRequest(url: url)

        // set the HTTP verb
        request.httpMethod = "GET"

        // set header for JSON
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")


        // create a data task
        let dataTask = session.dataTask(with: request) { data, response, error in
            guard let data else {return}    // if the data is nil, return

            // print(String(decoding: data, as: UTF8.self))   // if you receive completion handler, do this

            let decoder = JSONDecoder()
            do{
                let catsData = try decoder.decode(Cats.self, from: data)
                // print(catsData)

                DispatchQueue.main.async {
                    // put to main thread
                    delegate?.catsDataLoaded(data: catsData)
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
