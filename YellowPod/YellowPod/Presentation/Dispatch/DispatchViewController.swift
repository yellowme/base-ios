//
//  ViewController.swift
//  YellowPod
//
//  Created by Luis Burgos on 12/5/17.
//  Copyright © 2017 Yellowme. All rights reserved.
//

import UIKit

class DispatchViewController: BaseDispatchViewController {
    //MARK: - Outlets
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel! {
        didSet {
            messageLabel.text = "This is a message on the splash!!"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dispatcher.delegate = self
    }
    
    override func decorateViewIfNeeded() {
        makeNavigationBarTransparent()
        messageLabel.blink()
    }
}

extension DispatchViewController: DispatcherDelegate {
    func willLoadData() {
        // HERE: Handle your application flow depending on user session or another setting
    }
    
    func willLoadPreferences() {
        // HERE: Load info from user defaults
    }
    
    func shouldDisplayNoConnection() {
        // HERE: Change the main label message
        // messageLabel.text = String.noNetworkConnection
    }
    
    func shouldUpdateView() {
        // HERE: Make all your view updates after the connection has been validated
    }
}

