//
//  Networking+JSON.swift
//  YellowPod
//
//  Created by Luis Burgos on 2/1/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation
import SwiftyJSON

//MARK: - Parsing helpers
extension JSON {
    /**
     When your model defines a set of "required" keys,
     use this method to guarantee there are present on the JSON.
     */
    func guarantee(hasKeys: RemoteKeys...) throws {
        try hasKeys.forEach { key in
            guard self[key.rawValue].exists() else { throw SerializationError.missing(key.rawValue) }
        }
    }
    
    /**
     This method assumes that your are totally SURE that the key-value is present on the current JSON.
     */
    func parse(_ key: RemoteKeys) -> JSON {
        return self[key.rawValue]
    }
}

//MARK: Conditional Parsing
extension JSON {
    /**
     Only executes the "parsing" method when the key provided matchs any inside the current JSON.
     */
    func parseIfContains(key: RemoteKeys, _ block: @escaping (JSON) -> Void) {
        if self[key.rawValue].exists() {
            block(parse(key))
        }
    }
}

//MARK: Conditional Parsing Overloads
extension JSON {
    func parseIfContains(_ key1: RemoteKeys, _ key2: RemoteKeys, _ block: @escaping (JSON, JSON) -> Void) {
        if self[key1.rawValue].exists() && self[key2.rawValue].exists() {
            block(parse(key1), parse(key2))
        }
    }
    
    func parseIfContains(_ key1: RemoteKeys, _ key2: RemoteKeys, _ key3: RemoteKeys, _ block: @escaping (JSON, JSON, JSON) -> Void) {
        if self[key1.rawValue].exists() && self[key2.rawValue].exists() && self[key3.rawValue].exists() {
            block(parse(key1), parse(key2), parse(key3))
        }
    }
}
