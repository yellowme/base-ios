//
//  UsersServices.swift
//  YellowPod
//
//  Created by Luis Burgos on 11/25/17.
//  Copyright © 2017 YellowPod. All rights reserved.
//

import Foundation
import Alamofire

class UsersAPI: UsersAPIProtocol {
    func getCurrent(completion: @escaping (User?, String?) -> Void) {
        self.serverRequest(UsersRouter.current, UserParser()) { (user, error) in
            guard error == nil else {
                completion(nil, error)
                return
            }
            debugPrint(user ?? "No user")
            completion((user as? [User])?.first, nil)
        }
    }
}
