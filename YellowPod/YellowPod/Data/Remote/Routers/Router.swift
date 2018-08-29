//
//  Router.swift
//  YellowPod
//
//  Created by Luis Burgos on 11/24/17.
//  Copyright © 2017 YellowPod. All rights reserved.
//

import Foundation
import Alamofire

protocol AppRouter: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    
    func buildRequest() throws -> URLRequest
}

//MARK: - URL Builder
extension AppRouter {
    internal func commonRequest() throws -> URLRequest {
        var urlRequest = try URLRequest(url: path.asURL())
        urlRequest.httpMethod = method.rawValue
        return urlRequest
    }
    
    func asURLRequest() throws -> URLRequest {
        return try self.buildRequest()
    }
}

//MARK: Authentication Header Interceptor

extension AppRouter {
    func buildRequest() throws -> URLRequest {
        return try commonRequest()
    }
}

//MARK: - Authenticated
protocol AuthenticatedRouter: AppRouter {
    var authToken: String { get }
}

extension AppRouter where Self: AuthenticatedRouter {
    func buildRequest() throws -> URLRequest {
        debugPrint("Authenticated build request")
        var urlRequest = try commonRequest()
        
        debugPrint("Adding auth token \(authToken)")
        urlRequest.setValue(
            authToken,
            forHTTPHeaderField: AppHeaders.authKey
        )
        
        return urlRequest
    }
}

