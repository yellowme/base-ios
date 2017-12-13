//
//  APIClient.swift
//  YellowPod
//
//  Created by Luis Burgos on 11/24/17.
//  Copyright © 2017 YellowPod. All rights reserved.
//

import Foundation
import Alamofire

struct APIConstants {
    private static let URL = "" //HERE: Change to server URL
    static let apiBaseURL = "\(URL)" //"\(URL)/api/v1"
}

enum Path: String {
    //HERE: Define all your resources paths
    case users = "users"
}

enum Endpoints {
    //HERE: Define all your resources endpoint
    case Users
    var url: String {
        switch self {
        case .Users:
            return ""
        }
    }
}

struct AppHeaders {
    static let authKey = "Authorization"
    
    static func getHeaders(token: String?) -> HTTPHeaders {
        var headers: HTTPHeaders = [:]
        if let it = token {
            headers[AppHeaders.authKey] = it
        }
        return headers
    }
}

