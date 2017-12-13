//
//  API+URLs.swift
//  YellowPod
//
//  Created by Luis Burgos on 11/25/17.
//  Copyright © 2017 YellowPod. All rights reserved.
//

import Foundation

struct URLS { }

//MARK: Users
extension URLS {
    // Name: All users
    // Path: /users
    static let all = "\(APIConstants.apiBaseURL)/\(Path.users.rawValue)"
    
    // Name: Store user (POST)
    // Path: /users/
    // Body: User
    static let create = "\(URLS.all)/"
    
    // Name: Update User (PATCH)
    // Path: /users/:id
    // Body: : [String]
    static func update(id: String) -> String {
        return "\(URLS.all)/\(id)"
    }
}

//HERE: Define extensions for all your URLs
