//
//  NavigatorBridge.swift
//  YellowPod
//
//  Created by Luis Burgos on 1/31/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

typealias Transition = (controller: Controller, storyboard: Storyboard)

protocol TransitionAccessor {
    func getTransition() -> Transition?
}

//TODO: Extract this definition
public enum Flows: TransitionAccessor {
    case main
    case login
    case accessCode
    case show
    case preview
    case serviceDate
    case serviceInfo
    case dispatch
    case review
    
    func getTransition() -> Transition? {
        //Here you add the Transition combinations on your app
        switch self {
        case .main:
            return (.main, .main)
        case .login:
            return (.login, .login)
        case .accessCode:
            return (.accessCode, .accessCode)
        case .show:
            return (.show, .show)
        case .preview:
            return (.preview, .preview)
        case .serviceDate:
            return (.serviceDate, .serviceDate)
        case .serviceInfo:
            return (.serviceInfo, .serviceInfo)
        case .review:
            return (.review, .review)
        case .dispatch:
            return (.dispatch, .dispatch)
        }
    }
}

extension Navigator {
    class func setMainFlow(to flow: Flows) {
        if let transition = flow.getTransition() {
            //TODO: Refactor
            let controller = Navigator.get(controller: transition.controller, from: transition.storyboard, embedInNavigation: (flow == .main || flow == .show || flow == .review))
            Navigator.set(root: controller)
        }
    }
}
