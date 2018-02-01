//
//  MockSessionManager.swift
//  YellowPod
//
//  Created by Luis Burgos on 1/5/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

class MockUserManager: UserManagerProtocol {
    func save(user: User?) {
        //TODO: Modify if needed
    }
    
    func retrieve() -> User? {
        return MockHelper.getUserMock()
    }
    
    func clear() {
        //TODO: Modify if needed
    }
}
