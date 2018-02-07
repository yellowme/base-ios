//
//  UIViewController+Ext.swift
//  YellowPod
//
//  Created by Luis Burgos on 2/1/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

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
