//
//  SessionManagerProtocol.swift
//  Wawa
//
//  Created by Luis Burgos on 1/5/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

protocol UserManagerProtocol {
    func save(user: User?)
    func retrieve() -> User?
    func clear()
}
