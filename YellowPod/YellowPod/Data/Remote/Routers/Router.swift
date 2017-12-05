//
//  Router.swift
//  YellowPod
//
//  Created by Luis Burgos on 11/24/17.
//  Copyright © 2017 YellowPod. All rights reserved.
//

import Foundation
import Alamofire

protocol RequestDecorable {
    func decorate(_ urlRequest: inout URLRequest) throws -> URLRequest
}

protocol AppRouter: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
}

//MARK: - Request Builder

extension AppRouter {
    internal func commonRequest() throws -> URLRequest {
        var urlRequest = try URLRequest(url: path.asURL())
        urlRequest.httpMethod = method.rawValue
        return urlRequest
    }
}

//MARK: - URL Builder

extension AppRouter {
    func asURLRequest() throws -> URLRequest {
        var urlRequest = try self.buildRequest()
        if let decorable = self as? RequestDecorable {
            urlRequest = try decorable.decorate(&urlRequest)
        }
        return urlRequest
    }
}
