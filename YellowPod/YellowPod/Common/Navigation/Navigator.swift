//
//  Navigator.swift
//  YellowPod
//
//  Created by Luis Burgos on 1/31/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

//MARK: Base
/**
 Define all aplication navigation that depends on storyboards
 */
open class Navigator: NavigatorEmbedAware {
    var embedCases: [Flows] = [] // HERE: Add your embed cases
}

extension Navigator {
    class func get(controller: Controller, from storyboard: Storyboard, embedInNavigation: Bool = false) -> UIViewController? {
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(withIdentifier: controller.rawValue)
        if embedInNavigation {
            return UINavigationController(rootViewController: controller)
        }
        return controller
    }
    
    class func set(root viewController: UIViewController?, animatesTransition: Bool = true){
        guard viewController != nil else {
            return
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        if appDelegate.window == nil {
            print("Window on delegate is nil, creating new main screen with bounds")
            appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        }
        
        appDelegate.window?.rootViewController = viewController
        
        UIView.transition(with: appDelegate.window!, duration: animatesTransition ? 0.5 : 0.0, options: .transitionCrossDissolve, animations: {
            appDelegate.window?.makeKeyAndVisible()
        }, completion: nil)
    }
}
