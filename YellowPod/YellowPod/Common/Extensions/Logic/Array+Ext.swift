//
//  Array+Ext.swift
//  YellowPod
//
//  Created by Luis Burgos on 12/4/17.
//  Copyright © 2017 YellowPod. All rights reserved.
//

import Foundation

// Example:
//
// Having -> let numbers = [1, 2, 3, 4, 5, 6]
//
// let groupedNumbers = numbers.grouped(by: { (number: Int) -> String in
//    if number % 2 == 1 {
//        return "odd"
//    } else {
//        return "even"
//    }
// })
extension Array {
    func grouped<T>(by criteria: (Element) -> T) -> [T: [Element]] {
        var groups = [T: [Element]]()
        for element in self {
            let key = criteria(element)
            if groups.keys.contains(key) == false {
                groups[key] = [Element]()
            }
            groups[key]?.append(element)
        }
        return groups
    }
    
    func chunks(_ chunkSize: Int) -> [[Element]] {
        return stride(from: 0, to: self.count, by: chunkSize).map {
            Array(self[$0..<Swift.min($0 + chunkSize, self.count)])
        }
    }
}
