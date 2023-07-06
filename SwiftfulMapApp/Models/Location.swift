//
//  Location.swift
//  SwiftfulMapApp
//
//  Created by Abhiram Oggu on 2023/06/18.
//

import Foundation
import MapKit

struct Location: Identifiable, Equatable {
    
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    // conformed to identifiable 
    var id: String{
        // name = "RedFish"
        // cityName = "Hikone"
        // id = "RedFishHikone"
        name + cityName
    }
    
    // conformed to Equatable
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
    
    
}

