//
//  TokenHelper.swift
//  YellowPod
//
//  Created by Luis Burgos on 11/25/17.
//  Copyright © 2017 YellowPod. All rights reserved.
//

import Foundation

private class TokenHolder {
    var token: String?
}

class TokenHelper {
    var token: String {
        return TokenManager().retrieve() ?? ""
    }
    static let shared = TokenHelper()
    
    private init() { }
}

