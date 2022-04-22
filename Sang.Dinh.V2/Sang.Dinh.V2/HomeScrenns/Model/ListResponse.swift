//
//  Favorite.swift
//  Sang.Dinh.V2
//
//  Created by Rin Sang on 21/04/2022.
//

import Foundation

struct response {
    var venues: [venues]
}

struct venues {
    var id : Int?
    var name: String?
    var location: location
}

struct location {
    var address: String
    var lat: Float
    var lng: Float
    var distance : Int
    var formattedAddress: [String]
}
