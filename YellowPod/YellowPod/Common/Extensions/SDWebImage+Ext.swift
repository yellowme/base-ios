//
//  UIImageView+Ext.swift
//

import UIKit
import SDWebImage

private class PlaceHolderImageReference {
    var placeholder: String?
}

class PlaceHolderImageProvider {
    var placeholder: String?
    
    static let shared = PlaceHolderImageProvider()
    private static let setup = PlaceHolderImageProvider()
    
    class func setup(placeholder: String){
        PlaceHolderImageProvider.setup.placeholder = placeholder
    }
    
    private init() {
        guard let placeholder = PlaceHolderImageProvider.setup.placeholder else {
            fatalError("Error - you must call setup before accessing placeholder image")
        }
        //Regular initialisation using param
        self.placeholder = placeholder
    }
}

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
