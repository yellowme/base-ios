//
//  UIViewController+Ext.swift
//  YellowPod
//
//  Created by Luis Burgos on 11/12/17.
//  Copyright © 2017 YellowPod. All rights reserved.
//

import UIKit

//MARK: - Keyboard
extension UIViewController {
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func addDismissGestureRecognizer() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self, action: #selector(UIViewController.dismissKeyboard)
        )
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
}
