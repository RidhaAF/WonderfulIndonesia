//
//  PlaceController.swift
//  WonderfulIndonesia
//
//  Created by Ridha Ahmad Firdaus on 31/07/22.
//

import Foundation

class PlaceController: ObservableObject {
    @Published var places: [Place] = []
    
    func getPlaces(completion: @escaping ([Place]) -> ()) {
        guard let url = URL(string: "https://tourism-api.dicoding.dev/list") else {
            print("URL not valid!")
            return
        }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let data = data {
                do {
                    let places = try JSONDecoder().decode(Places.self, from: data)
                    let place = places.places
                    print(place)
                    
                    DispatchQueue.main.async {
                        self.places = place
                    }
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
}
