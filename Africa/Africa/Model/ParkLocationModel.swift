//
//  ParkLocationModel.swift
//  Africa
//
//  Created by Lucas de Castro Souza on 25/08/23.
//

import Foundation
import MapKit

struct ParkLocation: Codable, Identifiable {
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
