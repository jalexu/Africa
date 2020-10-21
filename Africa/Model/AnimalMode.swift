//
//  AnimalMode.swift
//  Africa
//
//  Created by Jaime Uribe on 17/10/20.
//

import SwiftUI

struct AnimalMode: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
}
