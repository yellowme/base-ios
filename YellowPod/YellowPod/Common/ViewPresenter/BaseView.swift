//
//  BaseView.swift
//  YellowPod
//
//  Created by Luis Burgos on 12/15/17.
//  Copyright © 2017 Yellowme. All rights reserved.
//

import UIKit

protocol BaseView: class {
    func setProgress(to isLoading: Bool, with alpha: CGFloat?, overlay: UIColor?)
    func display(_ message: String?)
}
