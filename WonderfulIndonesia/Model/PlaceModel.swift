//
//  PlaceModel.swift
//  WonderfulIndonesia
//
//  Created by Ridha Ahmad Firdaus on 31/07/22.
//

import Foundation

struct Places: Codable {
    var places: [Place]
}

struct Place: Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var address: String
    var longitude: Double
    var latitude: Double
    var like: Int
    var image: String
}
