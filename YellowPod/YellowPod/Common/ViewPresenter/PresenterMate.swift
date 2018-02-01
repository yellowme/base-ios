//
//  PresenterMate.swift
//  YellowPod
//
//  Created by Luis Burgos on 11/16/17.
//  Copyright © 2017 Yellowme. All rights reserved.
//

import Foundation

protocol PresenterMate {
    associatedtype Presenter
    var presenter: Presenter { get set }    
}
