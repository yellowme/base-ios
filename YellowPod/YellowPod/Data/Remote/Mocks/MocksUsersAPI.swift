//
//  UsersAPIMocks.swift
//  YellowPod
//
//  Created by Maria Jose Patron on 1/3/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

class MocksUsersAPI: UsersAPIProtocol {
    func confirmation(code: String, completion: @escaping (String?) -> Void) {
        completion(nil)
    }
    
    func resendCode(phone: String, completion: @escaping (String?) -> Void) {
        completion(nil)
    }
    
    func getCurrent(completion: @escaping (User?, String?) -> Void) {
        completion(getUserObject(), nil)
    }
    
    private func getUserObject() -> User {
        return MockHelper.getUserMock()
    }
}
