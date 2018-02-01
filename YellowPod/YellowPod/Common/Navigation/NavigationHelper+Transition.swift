//
//  UINavigationController+Transition.swift
//  YellowPod
//
//  Created by Luis Burgos on 1/2/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

//MARK: - Animation Types
public enum TransitionAnimationType {
    case none
    case push
}

//MARK: - Extras
protocol ControllerWithExtras: class {
    var extras: [ExtraKeys : Any]? { set get }
}

public enum ExtraKeys {
    case searchQuery
    case currentTravel
}

//MARK: - Methods
public extension UINavigationController {
    
    /**
     Retrieves a controller instance from a storyboard adding the extras defined
     */
    private func getController(with extras:[ExtraKeys : Any]? = nil, transitionFor flow: Flows) -> UIViewController {
        let transition = flow.getTransition()
        let controller = Navigator.get(controller: transition!.controller, from: transition!.storyboard)!
        (controller as? ControllerWithExtras)?.extras = extras
        return controller
    }
    
    /**
     Executes a defined push/pop transition using the controller defined on a particular flow (Flows)
     */
    internal func execute<T: UIViewController>(
        transitionFor flow: Flows,
        castingTo type: T.Type,
        extras: [ExtraKeys : Any]? = nil,
        animation: TransitionAnimationType = .none) {
        
        let controller = getController(with: extras, transitionFor: flow)
        switch animation {
        case .push:
            push(viewController: controller)
            break
        default:
            pushViewController(controller as! T, animated: true)
            break
        }
    }        
    
    /**
     Pop current view controller to previous view controller.
     
     - parameter type:     transition animation type.
     - parameter duration: transition animation duration.
     */
    func pop(transitionType type: String = kCATransitionFade, duration: CFTimeInterval = 0.5) {
        self.addTransition(type, duration: duration)
        self.popViewController(animated: false)
    }
    
    /**
     Push a new view controller on the view controllers's stack.
     
     - parameter controller: view controller to push.
     - parameter type: transition animation type.
     - parameter duration: transition animation duration.
     */
    func push(viewController controller: UIViewController, type: String = kCATransitionFade, duration: CFTimeInterval = 0.5) {
        self.addTransition( type, duration: duration)        
        self.pushViewController(controller, animated: false)
    }
    
    /**
     Adds a layer with the transition type defined
     */
    private func addTransition(_ type: String = kCATransitionFade, duration: CFTimeInterval = 0.5) {
        let transition = CATransition()
        transition.duration = duration
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = type
        self.view.layer.add(transition, forKey: nil)
    }    
}
