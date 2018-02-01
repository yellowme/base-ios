//
//  UIView+Blink.swift
//  YellowPod
//
//  Created by Luis Burgos on 12/29/17.
//  Copyright © 2017 Yellowme. All rights reserved.
//

import UIKit

extension UIView {
    func blink() {
        self.alpha = 0.2;
        UIView.animate(
            withDuration: 0.5,
            delay: 0.0,
            options: [.curveEaseInOut, .autoreverse, .repeat],
            animations: { [weak self] in self?.alpha = 1.0 },
            completion: { [weak self] _ in self?.alpha = 0.0 }
        )
    }
}
