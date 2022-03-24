//
//  LocationModel.swift
//  Africa
//
//  Created by Federico Torres on 29/06/2021.
//

import Foundation
import MapKit

struct Location: Codable, Identifiable {
    var id: String
    var name: String
    var image: String
    var latitude: Double
    var longitude: Double
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
