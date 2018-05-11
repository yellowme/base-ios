//
//  BaseDispatchViewController.swift
//  YellowPod
//
//  Created by Luis Burgos on 5/11/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Reachability
import UIKit

protocol DispatcherDelegate {
    func shouldDisplayNoConnection()
    func shouldUpdateView()
    func willLoadPreferences()
    func willLoadData()
}

class Dispatcher {
    var delegate: DispatcherDelegate?
}

class BaseDispatchViewController: UIViewController {
    //MARK: - Variables
    private let reachability = Reachability()!
    let dispatcher = Dispatcher()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decorateViewIfNeeded()
    }
    
    open func decorateViewIfNeeded() {
        //Implement if you need to load something dispite having a delegate for the dispatcher
    }
}

//MARK: - Network Observer
extension BaseDispatchViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(reachabilityChanged(note:)),
            name: .reachabilityChanged,
            object: reachability
        )
        do{
            try reachability.startNotifier()
        }catch{
            print("could not start reachability notifier")
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        reachability.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: reachability)
    }
}

//MARK: Network Responder
extension BaseDispatchViewController {
    @objc func reachabilityChanged(note: Notification) {
        let reachability = note.object as! Reachability
        if reachability.connection == .none {
            dispatcher.delegate?.shouldDisplayNoConnection()
        } else {
            dispatcher.delegate?.shouldUpdateView()
            dispatcher.delegate?.willLoadPreferences()
            dispatcher.delegate?.willLoadData()
        }
    }
}




