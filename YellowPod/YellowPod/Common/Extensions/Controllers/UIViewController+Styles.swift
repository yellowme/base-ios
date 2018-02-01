//
//  UIViewController+Styles.swift
//  YellowPod
//
//  Created by Luis Burgos on 12/15/17.
//  Copyright © 2017 Yellowme. All rights reserved.
//

import UIKit

//MARK: Style Helper
extension UIViewController {
    func setStyle(_ style: Style, for views: UIView...) {
        views.forEach { view in
            view.setStyle(style)
        }
    }
    
    func setDelegate(_ delegate: UITextFieldDelegate, for fields: UITextField...) {
        fields.forEach { field in
            field.delegate = delegate
        }
    }
}

//MARK: - Navigation Bar Stylist
extension UIViewController {
    func setNavigationTopItemTitleless() {
        navigationController?.navigationBar.topItem?.title = String.empty
    }
    
    func setTopControllerTitle(newTitle: String = String.appName) {
        navigationController?.topViewController?.navigationItem.title = newTitle
    }
    
    func makeSelfBackItemTitleless() {
        let backItem = UIBarButtonItem()
        backItem.title = String.empty
        navigationItem.backBarButtonItem = backItem
    }
    
    func makeNavigationBarTransparent() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
    }
    
    /**
     This removes the bottom border/shadow on the navigation bar
    */
    private func removeNavigationBarBorderShadow(){
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
}
