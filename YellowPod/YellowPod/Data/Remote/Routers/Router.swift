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
        var urlRequest = try self.buildRequest()
        if let decorable = self as? RequestDecorable {
            urlRequest = try decorable.decorate(&urlRequest)
        }
        return urlRequest
    }
}

//MARK: - Authentication Header Interceptor

extension AppRouter {
    func buildRequest() throws -> URLRequest {
        return try commonRequest()
    }
}

//MARK: - Decoration

/// Allows URL decoration for parameters
protocol RequestDecorable {
    func decorate(_ urlRequest: inout URLRequest) throws -> URLRequest
}

//MARK: - Authenticated

protocol AuthenticatedRouter: AppRouter {
    var authToken: String { get }
}

extension AuthenticatedRouter {
    var authToken: String {
        //TODO: Change access to TokenHolder or similar
        return ""
    }
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

