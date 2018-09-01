//
//  Session.swift
//  YellowPod
//
//  Created by Luis Burgos on 9/1/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

struct Session: Codable {
    let token: String
    let user: User
    
    enum CodingKeys: String, CodingKey {
        case token
        case user
    }
}
