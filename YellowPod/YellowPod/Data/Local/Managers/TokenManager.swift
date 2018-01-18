//
//  TokenManager.swift
//  Tripstr
//
//  Created by Luis Burgos on 11/26/17.
//  Copyright © 2017 Tripstr. All rights reserved.
//  

import Foundation

class TokenManager: LocalDataManager, LocalDataOperations {
    typealias Model = String

    func save(data: String?) {
        //defaults.set(data, forKey: LocalKeys.authToken.rawValue)
    }
    
    func retrieve() -> String? {
        //return defaults.string(forKey: LocalKeys.authToken.rawValue) as? String
        return "Basic YWRtaW46cGFzc3dvcmQxMjM="
    }
    
    func clear() {
        //defaults.set(nil, forKey: LocalKeys.authToken.rawValue)
    }
}
