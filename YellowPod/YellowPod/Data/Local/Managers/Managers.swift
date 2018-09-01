//
//  UserManager.swift
//  Aidwear
//
//  Created by Luis Burgos on 8/28/18.
//  Copyright © 2018 Shapp Inc. All rights reserved.
//

import Foundation

class UserManager: DefaultsManager<User> {
    override func keyString() -> String {
        return "currentUser"
    }
}

class SessionManager: DefaultsManager<Session> {
    override func keyString() -> String {
        return "currentSession"
    }
}
