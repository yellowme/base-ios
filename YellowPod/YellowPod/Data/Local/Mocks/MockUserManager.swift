//
//  MockSessionManager.swift
//  YellowPod
//
//  Created by Luis Burgos on 1/5/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

class MockUserManager: DefaultsManager<User> {
    override func keyString() -> String {
        return "mockUser"
    }
    
    override func save(data: User?) {
        //TODO: Modify if needed
    }
    
    override func retrieve() -> User? {
        return MockHelper.getUserMock()
    }
    
    override func clear() {
        //TODO: Modify if needed
    }
}
