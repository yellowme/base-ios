//
//  Parser.swift
//  YellowPod
//
//  Created by Luis Burgos on 11/26/17.
//  Copyright © 2017 YellowPod. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol Parser {
    func parse(_ json: JSON) throws -> [APIModel]?
}
