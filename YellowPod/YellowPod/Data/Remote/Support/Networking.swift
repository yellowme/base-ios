//
//  Networking.swift
//  YellowPod
//
//  Created by Luis Burgos on 11/25/17.
//  Copyright © 2017 YellowPod. All rights reserved.
//

import Foundation
import SwiftyJSON

enum SerializationError: Error {
    case missing(String)
    case invalid(String, Any)
    
    var message: String {
        switch self {
        case .missing(let error):
            return "Missing parameter: \(error)"
        case .invalid(let error, _):
            return "Invalid data \(error)"
        }
    }
}

/*Enable to throw a Key as error*/
extension Keys: Error {}

extension JSON {
    func guarantee(hasKeys: Keys...) throws {
        try hasKeys.forEach { key in
            guard self[key.rawValue].exists() else { throw SerializationError.missing(key.rawValue) }
        }
    }
    
    func parse(_ key: Keys) -> JSON {
        return self[key.rawValue]
    }
}

