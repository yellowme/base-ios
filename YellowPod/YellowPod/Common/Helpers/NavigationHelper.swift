//
//  NavigationHelper.swift
//  YellowPod
//
//  Created by Erick A. Montañez  on 11/29/17.
//  Copyright © 2017 YellowPod. All rights reserved.
//

import UIKit

// Define all aplication navigation that depends on storyboards
protocol Navigable {
    associatedtype Controllers
    associatedtype Storyboards
    associatedtype Segues
    associatedtype NavigationFlows
}

open class NavigationHelper: Navigable {
    typealias Controllers = Controller
    typealias Storyboards = Storyboard
    typealias Segues = Segue
    typealias NavigationFlows = Flows
}

extension NavigationHelper {
    class func get(controller: Controller, from storyboard: Storyboard) -> UIViewController? {
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: controller.rawValue)
    }
}

protocol ControllerWithExtras: class {
    var extras: [ExtraKeys : Any]? { set get }
}

enum ExtraKeys {
    case searchQuery
    case currentTravel
}

extension UINavigationController {
    func execute<T: UIViewController>(transitionFor: Flows, castingTo: T.Type, extras: [ExtraKeys : Any]? = nil) {
        if let transition = transitionFor.getTransition() {
            let controller = NavigationHelper.get(controller: transition.controller, from: transition.storyboard)
            (controller as? ControllerWithExtras)?.extras = extras
            pushViewController(controller as! T, animated: true)
        }
    }
}

typealias Transition = (controller: Controller, storyboard: Storyboard)

protocol TransitionAccessor {
    func getTransition() -> Transition?
}

//TODO: Extract this definition
public enum Flows: TransitionAccessor {
    func getTransition() -> Transition? {
        //Here you add the Transition combinations on your app
        /*switch self {
        case .main:
            return (.main, .main)
        case .listSomething:
            return (.main, .listSomething)
        }*/
        return nil
    }
}

public enum Segue: String {
    //Here add your segues
    case fromLoginToMain = "fromLoginToMain"
}

public enum Storyboard: String {
    //Here add your storyboard identifiers
    case main = "Main"
}

public enum Controller: String {
    //Here add your view controllers by name
    case main = "Main"
}
