//
//  User.swift
//  Aidwear
//
//  Created by Luis Burgos on 8/28/18.
//  Copyright © 2018 Shapp Inc. All rights reserved.
//

import Foundation

struct User: Codable {
    //HERE: Define all user variables
    var pk: String?
    
    private enum CodingKeys: CodingKey {
        case pk
    }
}
