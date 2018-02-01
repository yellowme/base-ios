//
//  UIApplication+Ext.swift
//

import Foundation
import UIKit

extension UIApplication {
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}

//MARK: Methods

protocol HasApply { }

extension HasApply {
    func safeLet(_ closure: (Self) -> ()) -> Void {
        closure(self)
    }
    
    func apply(_ closure: (Self) -> ()) -> Self {
        closure(self)
        return self
    }
}

extension NSObject: HasApply { }
