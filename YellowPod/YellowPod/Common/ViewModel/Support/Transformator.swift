//
//  Transformator.swift
//  YellowPod
//
//  Created by Luis Burgos on 12/3/17.
//  Copyright © 2017 YellowPod. All rights reserved.
//

import Foundation

protocol Transformator: class {
    associatedtype Holder
    associatedtype Model
    func transform(_ element: Model) -> Holder
}
