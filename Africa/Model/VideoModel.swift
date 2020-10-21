//
//  VideoModel.swift
//  Africa
//
//  Created by Jaime Uribe on 18/10/20.
//

import SwiftUI

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    //Computed properties
    
    var thumbnail: String {
        "video-\(id)"
    }
}
