//
//  LocalDataSourceManager.swift
//  YellowPod
//
//  Created by Luis Burgos on 9/1/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation
import DefaultsKit

//MARK: - Behavior
protocol LocalDataSourceManager {
    associatedtype Model: Codable
    func save(data: Model?)
    func retrieve() -> Model?
    func clear()
}

protocol DefaultsKeyHolder {
    func keyString() -> String
}

//MARK: - Implementation
class DefaultsManager<Model>: DefaultsKeyHolder, LocalDataSourceManager where Model: Codable {
    
    //MARK: - Key
    
    var key: Key<Model> {
        let keyString = self.keyString()
        guard !keyString.isEmpty else {
            fatalError("You must override keyString method and provide a valid key")
        }
        return Key<Model>(keyString)
    }
    
    func keyString() -> String {
        //IMPORTANT: Must Override
        return ""
    }
    
    //MARK: - Attributes
    
    let defaults = Defaults()
    
    //MARK: - LocalDataSourceManager
    
    func save(data: Model?) {
        /*
         Use `if-let` statement to help xcode compiler identifiying the type of the Key<>.
         Do not use `guard` statement.
         */
        if let data = data {
            defaults.set(data, for: key)
        }
    }
    
    func retrieve() -> Model? {
        return defaults.get(for: key)
    }
    
    func clear() {
        defaults.clear(key)
    }
    
}
