//
//  UIButton+Ext.swift
//  YellowPod
//
//  Created by Maria Jose Patron on 12/14/17.
//  Copyright © 2017 Yellowme. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    //Use this in viewDidLayoutSubviews to update the rounded ratio of a button according to its size
    func updateRadiusForDevice(){
        //Magic number if determine by the current device whether is a iPhone or iPad.
        //TODO: Change to conditianl using macros
        self.layer.cornerRadius = ((self.layer.cornerRadius * UIScreen.main.bounds.width) / 375.0)
    }
    
    func makeRoundButton(borderless: Bool = false){
        self.layer.cornerRadius = self.layer.frame.height / 2
        if !borderless {
            self.layer.borderWidth = 1
        }
        self.layer.masksToBounds = true
    }
    
    func setWhiteButtonStyle() {
        self.layer.cornerRadius = 25
        self.backgroundColor = .white
        self.tintColor = .warmBlue
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    func addSelectedState(image: String) {
        setBackgroundImage(UIImage(named: image), for: UIControlState.selected)
    }
    
    func addNormalState(image: String) {
        setBackgroundImage(UIImage(named: image), for: UIControlState.normal)
    }
    
    func setupStates(imageForSelected: String, imageForNormal: String) {
        addSelectedState(image: imageForSelected)
        addNormalState(image: imageForNormal)
    }
}
