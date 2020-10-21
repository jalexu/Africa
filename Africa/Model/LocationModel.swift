//
//  LocationModel.swift
//  Africa
//
//  Created by Jaime Uribe on 19/10/20.
//

import Foundation
import MapKit

struct LocationModel: Codable, Identifiable {
    
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    // Computed properited
    var location: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
}
