//
//  User.swift
//  YellowPod
//
//  Created by Luis Burgos on 12/5/17.
//  Copyright © 2017 Yellowme. All rights reserved.
//

import Foundation
import SwiftyJSON

struct User {
    //HERE: Define all user variables
}

extension User: APIModel {
    init(json: JSON) throws {
        //HERE: - Map all variables. Go to "Networking+Keys" and define all your keys
        
        //HERE: - 1. Validate keys you want
        //try json.guarantee(hasKeys: .id, .name)
        
        //HERE: - 2. Obtain values from keys
        //guard let id = json.parse(.id).string else { throw Keys.id }
        //guard let name = json.parse(.name).string else { throw Keys.name }
        
        //HERE: - 3. Assign the parsed values
        //self.id = id
        //self.name = name
    }
}
