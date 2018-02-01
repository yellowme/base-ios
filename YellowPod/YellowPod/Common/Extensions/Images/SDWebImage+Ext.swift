//
//  SDWebImage+Ext.swift
//  YellowPod
//
//  Created by Luis Burgos on 1/31/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit
import SDWebImage

public extension UIImageView {
    public func loadImageFromUrl(_ urlString: String) {
        self.loadImageFromUrl(urlString, circular: false, bordered: false, rounded: false)
    }
    
    public func loadImageFromUrl(_ urlString: String, circular: Bool, bordered: Bool, rounded: Bool) {
        self.loadImageFromUrl(urlString, circular: circular, bordered: bordered, rounded: rounded, borderColor: nil)
    }
    
    public func loadImageFromUrl(_ urlString: String, circular: Bool, bordered: Bool, rounded: Bool, borderColor: CGColor?) {
        if let url = URL(string: urlString) {
            if circular {
                self.cutCircular()
            }
            if bordered {
                if let borderColor = borderColor{
                    self.addBorder(borderColor, strokeWidth: 3.5)
                } else {
                    self.addWhiteBorder()
                }
            }
            if let placeholder = PlaceHolderImageProvider.shared.placeholder {
                self.sd_setImage(with: url, placeholderImage: UIImage(named: placeholder))
            } else {
                self.sd_setImage(with: url)
            }
        }
    }
}
