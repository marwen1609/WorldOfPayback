//
//  Bundle+extensions.swift
//  WorldOfPAYBACK
//
//  Created by Marwen Jamel on 17.03.23.
//

import Foundation


extension Bundle {

    func decode<T: Decodable>(_ type: T.Type, from filename: String) -> T? {
        guard let json = url(forResource: filename, withExtension: nil) else {
            print("Failed to locate \(filename) in app bundle.")
            return nil
        }
        do {
            let jsonData = try Data(contentsOf: json)
            let decoder = JSONDecoder()
            let result = try decoder.decode(T.self, from: jsonData)
            return result
        } catch {
            print("Failed to load and decode JSON \(error)")
            return nil
        }
    }
}
