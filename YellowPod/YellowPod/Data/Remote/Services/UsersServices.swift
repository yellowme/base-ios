//
//  UsersServices.swift
//  YellowPod
//
//  Created by Luis Burgos on 11/25/17.
//  Copyright © 2017 YellowPod. All rights reserved.
//

import Foundation
import Alamofire

class UsersServices: AuthenticatedDataSource {
    //TODO: Not used
    func getAll(completion: @escaping ([User]?, String?) -> Void) {
        self.serverRequest(UsersRouter.allUsers, UserListParser()) { (users, error) in
            completion(users as? [User], error)
        }
    }
    
    //TODO: Add parameters and completion method
    func createUser() {
        self.serverRequest(UsersRouter.createUser(parameters: [:]), nil) { (data, error) in
            //TODO: Call completion
        }
    }
    
    //HERE: Add more service calls
}
