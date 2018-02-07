//
//  UIApplication+Ext.swift
//

import UIKit

/**
 Place a top view controller depending on current root controller.
 */
extension UIApplication {
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let selectedFromTabBar = (controller as? UITabBarController)?.selectedViewController {
            return topViewController(controller: selectedFromTabBar)
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}
