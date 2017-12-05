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
    case allUsers
    case createUser(parameters: Parameters)
    case updateUser(id: String, parameters: Parameters)
    
    var method: HTTPMethod {
        switch self {
        case .allUsers:
            return .get
        case .createUser:
            return .post
        case .updateUser:
            return .patch
        }
    }
    
    var path: String {
        switch self {
        case .allUsers:
            return URLS.all
        case .createUser(_):
            return URLS.create
        case .updateUser(let id, _):
            return URLS.update(id: id)
        }
    }
    
    // MARK: Customize Request    
    func decorate(_ urlRequest: inout URLRequest) throws -> URLRequest {
        switch self {
        case .createUser(let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .updateUser(_, let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        default:
            break
        }
        return urlRequest
    }
}
