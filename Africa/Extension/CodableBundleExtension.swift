//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Jaime Uribe on 17/10/20.
//

import Foundation

extension Bundle{
    
    //Se retorna un generico para poder retornar cualqueir lista
    func decode<T: Codable>(_ file: String) -> T {
        //1. Locate the json file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to located \(file) in bundle.")
        }
        
        //2. Create a property for data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) in bundle.")
        }
        
        // 3. Create a decoder
        let decoder = JSONDecoder()
        
        //4. Creaate a property for decoded data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) in bundle")
        }
        
        //5.Return the ready-use-data
        return loaded
    }
}
