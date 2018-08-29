//
//  Networking.swift
//  YellowPod
//
//  Created by Luis Burgos on 11/25/17.
//  Copyright © 2017 YellowPod. All rights reserved.
//

import Foundation

/**
 Serialization throwing error helper during JSON parsing
 */
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
