//
//  apiKeysService.swift
//  BonusProgramApp
//
//  Created by Михайлов Александр on 08.08.2023.
//

import Foundation

struct Keys: Decodable {
    let GENERATOR_API_KEY: String
}

struct KeysAPIService {
    static func get() -> Keys {
        guard let url = Bundle.main.url(forResource: "API-Keys", withExtension: "plist") else {
            fatalError("Could not find API-Keys plist in your Bundle")
        }
        do {
            let data = try Data(contentsOf: url)
            let key = try PropertyListDecoder().decode(Keys.self, from: data)
            return key
            
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
}
