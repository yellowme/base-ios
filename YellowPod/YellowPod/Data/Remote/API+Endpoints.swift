//
//  Endpoints.swift
//  YellowPod
//
//  Created by Luis Burgos on 1/26/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

/**
 Defines a resource from the API.
 */
protocol RemoteResource {
    var endpoint: String { get }
    var url: String { get }
}

enum Endpoints {
    enum Users: RemoteResource {
        case find(userId: String)
        case all
        case create
        
        var endpoint: String {
            switch self {
            case .find(let userId):
                return "\(url)\(userId)"
            case .all:
                return url
            case .create:
                return url
            }
        }
        
        var url: String {
            return  "\(APIConstants.apiBaseURL)/user/"
        }
    }
    
    // HERE: Add your custom endpoints
}
