//
//  ViewController.swift
//  YellowPod
//
//  Created by Luis Burgos on 12/5/17.
//  Copyright © 2017 Yellowme. All rights reserved.
//

import UIKit

class DispatchViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel! {
        didSet {
            messageLabel.text = "This is a message on the splash!!"
        }
    }
    
    //MARK: - Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        makeNavigationBarTransparent()
        messageLabel.blink()
        loadData()
    }

}

extension DispatchViewController {
    internal func loadData() {
        // HERE: Handle your application flow depending on user session or another setting
    }
}

