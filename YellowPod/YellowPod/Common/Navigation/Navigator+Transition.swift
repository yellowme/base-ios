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

public enum Flows: TransitionAccessor {
    case main
    case login    
    
    func getTransition() -> Transition? {
        //Here you add the Transition combinations on your app
        switch self {
        case .main:
            return (.main, .main)
        case .login:
            return (.login, .login)        
        }
    }
}

protocol NavigatorEmbedAware {
    var embedCases: [Flows] { get set }
}

extension NavigatorEmbedAware where Self: Navigator {
    func setMainFlow(to flow: Flows) {
        if let transition = flow.getTransition() {
            let controller = Navigator.get(
                controller: transition.controller,
                from: transition.storyboard,
                embedInNavigation: self.shouldEmbedInNavigation(for: flow)
            )
            Navigator.set(root: controller)
        }
    }
    
    private func shouldEmbedInNavigation(for flow: Flows) -> Bool {
        return self.embedCases.filter({ current in
            return current == flow
        }).count > 0
    }
}
