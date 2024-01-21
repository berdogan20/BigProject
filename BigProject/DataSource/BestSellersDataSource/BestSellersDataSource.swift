//
//  BestSellersDataSource.swift
//  BigProject
//
//  Created by beyza erdoğan on 21.01.2024.
//

import Foundation

struct BestSellersDataSource {

    private let baseURL = "https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=RcYbkTAiRTqgmFZ372Jo1kSRKcneG478"
    var delegate: BestSellersDataSourceDelegate?

    func loadBestSellersData(){

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

            //print(String(decoding: data, as: UTF8.self))   // if you receive completion handler, do this

            let decoder = JSONDecoder()
            do{
                let bestSellersData = try decoder.decode(BestSellers.self, from: data)
                //print(bestSellersData)

                DispatchQueue.main.async {
                    // put to main thread
                    delegate?.bestSellersDataLoaded(data: bestSellersData)
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

