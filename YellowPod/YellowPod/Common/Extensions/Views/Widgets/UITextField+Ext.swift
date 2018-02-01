//
//  UITextField+Ext.swift
//  YellowPod
//
//  Created by Maria Jose Patron on 12/14/17.
//  Copyright © 2017 Yellowme. All rights reserved.
//

import UIKit

//MARK: Style
extension UITextField {
    func setBottomBorder(width: CGFloat = 1.0, color: UIColor = .textColor) {
        let border = CALayer()
        border.borderColor = color.cgColor
        border.frame = CGRect(x: 0, y: frame.size.height - width, width:  frame.size.width, height: frame.size.height)
        border.borderWidth = width
        layer.addSublayer(border)
        layer.masksToBounds = true
    }
    
    func setPlaceholder(text: String, color: UIColor = UIColor.textColor50) {
        self.attributedPlaceholder = NSAttributedString(
                string: text,
                attributes: [NSAttributedStringKey.foregroundColor : color]
        )
    }
    
    func addLeftImage(image: String) {
        self.leftViewMode = UITextFieldViewMode.always
        let imageView = UIImageView()
        imageView.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: 30.0, height: 30.0)
        imageView.image = UIImage(named: image)
        imageView.contentMode = UIViewContentMode.left
        self.leftView = imageView
    }
}

//MARK: State
extension UITextField {
    var isEmpty: Bool {
        return text?.isEmpty ?? true
    }
    
    func clear() {
        text = ""
    }
}

