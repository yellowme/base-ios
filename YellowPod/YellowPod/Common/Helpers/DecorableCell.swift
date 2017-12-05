//
//  DecorableCell.swift
//  YellowPod
//
//  Created by Luis Burgos on 12/2/17.
//  Copyright © 2017 YellowPod. All rights reserved.
//

import Foundation

protocol DecorableCell {
    associatedtype model
    func decorate(with model: model)
}
