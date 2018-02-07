//
//  Manager.swift
//  Tripstr
//
//  Created by Luis Burgos on 11/26/17.
//  Copyright © 2017 Tripstr. All rights reserved.
//

import Foundation

protocol LocalDataManager {}

protocol LocalDataOperations {
    associatedtype Model
    
    func save(data: Model?)
    func retrieve() -> Model?
    func clear()
}

protocol ArrayLocalDataOperations {
    associatedtype Model
    
    func save(data: [Model]?)
    func retrieve() -> [Model]?
    func remove(_ atIndex: Int)
    func clear()
}
