//
//  LocalKeys.swift
//  Tripstr
//
//  Define all the storable keys, only consideration must be that you must use the
//  inner enum name in lowercase as prefix for your key.
//
//  Created by Luis Burgos on 11/26/17.
//  Copyright © 2017 Tripstr. All rights reserved.
//

import Foundation

enum LocalKeys {
    enum User: String {
        case current = "user-current"
    }
    
    enum Token: String {
        case authToken = "token-auth"
    }
    
    //HERE: Add your custom keys
}
