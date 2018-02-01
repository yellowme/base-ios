//
//  CLPlaceMark+Ext.swift
//  YellowPod
//
//  Created by Luis Burgos on 1/23/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation
import CoreLocation.CLPlacemark

struct CLPlacemarkKeys {
    static let name = "Name"
    static let thoroughfare = "Thoroughfare"
    static let city = "City"
    static let subLocality = "SubLocality"
}

extension CLPlacemark {
    func buildAddress() -> String {
        var address = ""
        guard (name != nil) else { return String.unknownZone }
        
        address += name!
        
        if let city = thoroughfare {
            address += ", \(city)"
        }
        
        if let subLocality = subLocality {
            address += ", \(subLocality)"
        }
        
        return address
    }
}
