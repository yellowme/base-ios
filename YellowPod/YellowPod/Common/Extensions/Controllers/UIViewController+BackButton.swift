//
//  UIViewController+BackButton.swift
//  YellowPod
//
//  Created by Luis Burgos on 1/4/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

@objc protocol BackButtonResponder {
    @objc func back()
}

enum BackButtonResponderError: Error {
    case doesNotconformProtocol
}

extension UIViewController {
    func addBackButton(withIconNamed: String) throws {
        // TODO: Change to runtime error
        guard self is BackButtonResponder else {
            throw BackButtonResponderError.doesNotconformProtocol
        }
        navigationItem.hidesBackButton = true
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage(named: withIconNamed), for: .normal)
        button.addTarget(self, action: #selector((self as! BackButtonResponder).back), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        
        let newBackButton = UIBarButtonItem(customView: button)
        navigationItem.leftBarButtonItem = newBackButton
    }
}
