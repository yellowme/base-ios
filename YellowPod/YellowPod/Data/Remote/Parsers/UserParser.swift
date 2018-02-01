//
//  Parser.swift
//  YellowPod
//
//  Created by Luis Burgos on 11/24/17.
//  Copyright © 2017 YellowPod. All rights reserved.
//

import Foundation
import SwiftyJSON

// An ARRAY parsing Example
// guard let userObject = json.parse(.user).array?.first else { throw Keys.user }

class UserParser: Parser {
    func parse(_ json: JSON) throws -> [APIModel]? {
        let user = try User.init(json: json.parse(.data))
        return [user]
    }
}

class UserListParser: Parser {
    func parse(_ json: JSON) throws -> [APIModel]? {
        return User.toList(from: json, parser: UserParser())
    }
}
