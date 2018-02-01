//
//  TokenManager.swift
//  Tripstr
//
//  Created by Luis Burgos on 11/26/17.
//  Copyright © 2017 Tripstr. All rights reserved.
//

import Foundation
import DefaultsKit

class TokenManager: LocalDataManager, LocalDataOperations {
    static let tokenKey = Key<String>(LocalKeys.Token.authToken.rawValue)
    let defaults = Defaults()
    
    func save(data: String?) {
        if let data = data {
            defaults.set(data, for: TokenManager.tokenKey)
        }
    }
    
    func retrieve() -> String? {
        return defaults.get(for: TokenManager.tokenKey)
    }
    
    func clear() {
        defaults.clear(TokenManager.tokenKey)
    }
}
