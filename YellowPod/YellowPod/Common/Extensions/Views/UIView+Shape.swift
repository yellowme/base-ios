//
//  UIView+Ext.swift
//

import UIKit

//MARK: - Shapes
public extension UIView {
    public func cutRounded(){
        self.layer.cornerRadius = 8.0
        self.clipsToBounds = true
    }
    
    public func cutCircular(){
        self.layer.cornerRadius = self.frame.size.width / 2;
        self.clipsToBounds = true;
    }    
}

//MARK: - Border
public enum StrokeType: CGFloat {
    case medium = 3.5
    case thin = 1.5
}

public extension UIView {
    public func addBorder(_ borderColor: CGColor, strokeWidth: StrokeType = .medium) {
        self.layer.borderColor = borderColor
        self.layer.borderWidth = strokeWidth.rawValue
    }
    
    //MARK: - Custom
    
    public func addWhiteBorder(){
        self.addBorder(UIColor.white.cgColor)
    }
}
