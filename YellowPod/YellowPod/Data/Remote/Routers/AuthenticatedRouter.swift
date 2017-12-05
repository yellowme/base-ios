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

protocol AuthenticatedRouter: AppRouter {
    var authToken: String { get }
}

extension AuthenticatedRouter {
    var authToken: String {
        return TokenHelper.shared.token
    }
    
    internal func buildAuthRequest() throws -> URLRequest {
        debugPrint("Authenticated build request")
        var urlRequest = try commonRequest()
        urlRequest.setValue(authToken, forHTTPHeaderField: AppHeaders.authKey)
        return urlRequest
    }
}
