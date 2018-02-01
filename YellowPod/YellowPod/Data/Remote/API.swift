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
    private static let URL = InfoPlistHelper.lookUpFor(.api) ?? ""
    static let apiBaseURL = "\(URL)/api/v1"
}

struct AppHeaders {
    static let authKey = "Authorization"
    // HERE: Add your headers keys
}

