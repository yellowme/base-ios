//
//  UserManager.swift
//  Tripstr
//
//  Created by Luis Burgos on 11/26/17.
//  Copyright © 2017 Tripstr. All rights reserved.
//

import Foundation

class UserManager: LocalDataManager, LocalDataOperations {
    typealias Model = User
    
    func save(data: User?) {
        //Not necessary
        //defaults.set(data, forKey: LocalKeys.User.current.rawValue)
    }
    
    func retrieve() -> User? {
        return nil
    }
    
    func clear() {
        //Not necessary
    }
}
