//
//  CatImagesDataSource.swift
//  BigProject
//
//  Created by beyza erdoğan on 21.01.2024.
//

import Foundation

struct CatImagesDataSource{

    private let baseURL = "https://api.thecatapi.com/v1/images/search?limit=10&breed_ids="
    var delegate: CatImagesDataSourceDelegate?


    func loadCatImages(id: String){

        // get shared URL session
        let session = URLSession.shared

        // create a URL
        // returns an optional String
        guard let url = URL(string: "\(baseURL)\(id)&api_key=live_jRujGSzAcIpO0LWLAaqzOjuBaAR9Fy8NKaVbSE2XyJkEnyjCZKHaSM2cG2T2I3n7") else {return}

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
                let catImages = try decoder.decode(CatImages.self, from: data)
                // print(catsData)

                DispatchQueue.main.async {
                    // put to main thread
                    delegate?.catImagesLoaded(data: catImages)
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
