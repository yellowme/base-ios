//
//  PlaceHolderImageProvider.swift
//  YellowPod
//
//  Created by Luis Burgos on 1/31/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

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
