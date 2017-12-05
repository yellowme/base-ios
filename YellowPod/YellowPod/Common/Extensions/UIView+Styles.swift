//
//  UIView+Styles.swift
//  YellowPod
//
//  Created by Luis Burgos on 12/5/17.
//  Copyright © 2017 Yellowme. All rights reserved.
//

import UIKit

enum Style {
    //Here define all your Styles
    case RoundButton(radius: CGFloat)
}

extension UIView {
    func setStyle(_ style: Style) {
        switch style {
        case .RoundButton(let radius):
            if let button = self as? UIButton {
                button.layer.cornerRadius = radius
            }
            break
        }
    }
}

extension UIView {
    func makeHeight(to: CGFloat) {
        var frameRect = frame
        frameRect.size.height = to // <-- Specify the height you want here.
        frame = frameRect
    }
}
