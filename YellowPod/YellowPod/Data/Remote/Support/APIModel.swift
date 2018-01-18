//
//  APIModel.swift
//  YellowPod
//
//  Created by Luis Burgos on 11/25/17.
//  Copyright © 2017 YellowPod. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol APIModel {
    init(json: JSON) throws
}

extension APIModel {
    static func fromListToList(from json: [JSON]?, parser: Parser) -> [APIModel] {
        var list = [APIModel]()
        if let listJSON = json {
            for element in listJSON {
                let parsedElement = toList(from: element, parser: parser)
                list += parsedElement
            }
        }
        return list
    }
    
    static func toList(from json: JSON?, parser: Parser) -> [APIModel] {
        var list = [APIModel]()
        if let listJSON = json?.array {
            for element in listJSON {
                do {
                    let items = try parser.parse(element)
                    items?.forEach {
                        list.append($0)
                    }
                } catch let error as SerializationError {
                    debugPrint(error)
                } catch {
                    debugPrint(error)
                }
            }
        }
        return list
    }
}
