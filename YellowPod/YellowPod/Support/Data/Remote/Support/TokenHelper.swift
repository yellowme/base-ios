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
    var token: String
    static let shared = TokenHelper()
    private static let setup = TokenHolder()
    
    class func setup(token: String){
        TokenHelper.setup.token = token
    }
    
    private init() {
        guard let token = TokenHelper.setup.token else {
            fatalError("Error - you must call setup before accessing token")
        }
        
        //Regular initialisation using param
        self.token = token
    }
}
