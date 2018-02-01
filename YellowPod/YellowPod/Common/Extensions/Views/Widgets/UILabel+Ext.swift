//
//  UILabel+Ext.swift
//  YellowPod
//
//  Created by Luis Burgos on 1/5/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit.UILabel

extension UILabel {
    func setFontSizeToFill() {
        let frameSize  = self.bounds.size
        guard frameSize.height>0 && frameSize.width>0 && self.text != nil else {return}
        
        var fontPoints = self.font.pointSize
        var fontSize   = self.text!.size(withAttributes: [NSAttributedStringKey.font: self.font.withSize(fontPoints)])
        var increment  = CGFloat(0)
        
        if fontSize.width > frameSize.width || fontSize.height > frameSize.height {
            increment = -1
        } else {
            increment = 1
        }
        
        while true {
            fontSize = self.text!.size(withAttributes: [NSAttributedStringKey.font: self.font.withSize(fontPoints+increment)])
            if increment < 0 {
                if fontSize.width < frameSize.width && fontSize.height < frameSize.height {
                    fontPoints += increment
                    break
                }
            } else {
                if fontSize.width > frameSize.width || fontSize.height > frameSize.height {
                    break
                }
            }
            fontPoints += increment
        }
        
        self.font = self.font.withSize(fontPoints)
    }
}

extension UILabel {
    func adjustsFontToTrulyFit() {
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.5
        numberOfLines = 1
    }
    
    func fitFontForSize(minFontSize: CGFloat = 5.0, maxFontSize: CGFloat = 300.0, accuracy: CGFloat = 1.0) {
        var maxFontSize = maxFontSize
        var minFontSize = minFontSize
        assert(maxFontSize > minFontSize)
        layoutIfNeeded() // Can be removed at your own discretion
        let constrainedSize = bounds.size
        while maxFontSize - minFontSize > accuracy {
            let midFontSize : CGFloat = ((minFontSize + maxFontSize) / 2)
            font = font.withSize(midFontSize)
            sizeToFit()
            let checkSize : CGSize = bounds.size
            if  checkSize.height < constrainedSize.height && checkSize.width < constrainedSize.width {
                minFontSize = midFontSize
            } else {
                maxFontSize = midFontSize
            }
        }
        font = font.withSize(minFontSize)
        sizeToFit()
        layoutIfNeeded() // Can be removed at your own discretion
    }
}
