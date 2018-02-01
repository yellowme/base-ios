//
//  UITextField+ToolbarDoneResponder.swift
//  YellowPod
//
//  Created by Maria Jose Patron on 12/28/17.
//  Copyright © 2017 Yellowme. All rights reserved.
//

import UIKit

@objc protocol ToolbarDoneResponder {
    @objc func doneDatePicker()
}

enum ToolbarResponderError: Error {
    case doesNotconformProtocol
}

extension UITextField {
    func addToolbarWithButton(buttonTitle: String, controller: UIViewController) throws {
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.default
        toolbar.isTranslucent = true
        toolbar.sizeToFit()
        
        //TODO: Change to runtime error
        guard controller is ToolbarDoneResponder else {
            throw ToolbarResponderError.doesNotconformProtocol
        }
        
        let button = UIBarButtonItem(
            title: buttonTitle, style: .plain, target: controller,
            action: #selector((controller as! ToolbarDoneResponder).doneDatePicker)
        )
        let spaceButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace, target: nil, action: nil
        )
        toolbar.setItems([spaceButton, button], animated: false)
        self.inputAccessoryView = toolbar
    }
}
