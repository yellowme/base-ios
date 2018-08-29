//
//  UsersRouter.swift
//  YellowPod
//
//  Created by Luis Burgos on 11/25/17.
//  Copyright © 2017 YellowPod. All rights reserved.
//

import Foundation
import Alamofire

enum UsersRouter: AuthenticatedRouter {
    var authToken: String {
        //TODO: Change access to TokenHolder or something
        return ""
    }
    
    case current
    case create(Parameters)
    
    var method: HTTPMethod {
        switch self {
        case .current:
            return .get
        case .create:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .current:
            return Endpoints.Users.all.url // TODO: Customize
        case .create:
            return Endpoints.Users.all.url
        }
    }
    
    // MARK: Customize Request    
    func decorate(_ urlRequest: inout URLRequest) throws -> URLRequest {
        switch self {
        case .create(let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)        
        default:
            break
        }
        return urlRequest
    }
}
