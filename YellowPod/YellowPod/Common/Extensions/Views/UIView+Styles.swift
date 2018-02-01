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
    case BlueRoundButton
    case WhiteRoundButton
    case GrayRoundButton
    case BlueTextButton
    case TextButton
    case ServiceInfoButtonNormal
    case ServiceInfoButtonActive
    case ResultsTableView
    case SearchBox
}

extension UIView {
    func setStyle(_ style: Style) {
        switch style {
        case .BlueTextButton:
            if let button = self as? UIButton {
                button.tintColor = .warmBlue
                button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            }
            break
        case .WhiteRoundButton:
            //TODO: Evaluate refactor
            if let button = self as? UIButton {
                button.layer.cornerRadius = 25
                button.backgroundColor = .white
                button.tintColor = .warmBlue
                button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            }
            break
        case .BlueRoundButton:
            if let button = self as? UIButton {
                button.layer.cornerRadius = 25
                button.backgroundColor = .warmBlue
                button.tintColor = .textColor
                button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            }
            break
        case .GrayRoundButton:
            if let button = self as? UIButton {
                button.layer.cornerRadius = 25
                button.backgroundColor = .silver
                button.tintColor = .textColor
                button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            }
            break
        case .RoundButton(let radius):
            if let button = self as? UIButton {
                button.layer.cornerRadius = radius
            }
            break        
        case .TextButton:
            if let button = self as? UIButton {
                button.titleLabel?.numberOfLines = 1
                button.titleLabel?.adjustsFontSizeToFitWidth = true
                button.titleLabel?.lineBreakMode = .byClipping
            }
            break
        case .ServiceInfoButtonNormal:
            if let button = self as? UIButton {
                button.layer.cornerRadius = 5
                button.layer.backgroundColor = UIColor.white.cgColor
                button.layer.shadowColor = UIColor.warmBlue15.cgColor;
                button.layer.shadowOffset = CGSize(width: 0, height: 5);
                button.layer.shadowRadius = 5
                button.layer.shadowOpacity = 1.0;
                button.layer.borderWidth = 0
            }
            break
        case .ServiceInfoButtonActive:
            if let button = self as? UIButton {
                button.layer.cornerRadius = 5
                button.layer.backgroundColor = UIColor.warmBlue10.cgColor
                button.layer.borderColor = UIColor.warmBlue.cgColor
                button.layer.borderWidth = 1
            }
            break     
        case .ResultsTableView:
            if let table = self as? UITableView {
                table.rowHeight = 75
                table.separatorStyle = .none
            }
            break        
        case .SearchBox:
            layer.cornerRadius = 5
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
