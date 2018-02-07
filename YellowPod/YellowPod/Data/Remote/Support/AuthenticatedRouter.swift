//
//  AuthenticatedRouter.swift
//  YellowPod
//
//  Created by Luis Burgos on 12/5/17.
//  Copyright © 2017 Yellowme. All rights reserved.
//

import Foundation

//MARK: Authentication Header Interceptor

extension AppRouter {
    internal func buildRequest() throws -> URLRequest {
        if let authenticatedRouter = self as? AuthenticatedRouter {
            return try authenticatedRouter.buildAuthRequest()
        }
        debugPrint("Common build request")
        return try commonRequest()
    }
}

//MARK: - Authenticated

protocol AuthenticatedRouter: AppRouter, RequestDecorable {
    var authToken: String { get }
}

extension AuthenticatedRouter {
    var authToken: String {
        return TokenHelper.shared.token
    }
    
    internal func buildAuthRequest() throws -> URLRequest {
        debugPrint("Authenticated build request")
        var urlRequest = try commonRequest()
        debugPrint("Adding auth token \(authToken)")
        urlRequest.setValue(authToken, forHTTPHeaderField: AppHeaders.authKey)
        
        //TODO: Improve HEADER assignation
        
        return urlRequest
    }
}

//MARK: - Helper

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

