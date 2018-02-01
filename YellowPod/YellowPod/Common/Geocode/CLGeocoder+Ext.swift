//
//  CLGeocoder+Ext.swift
//  YellowPod
//
//  Created by Luis Burgos on 1/23/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import CoreLocation.CLGeocoder
import CoreLocation.CLLocation

public extension CLGeocoder {
    /**
     Enables passing a custom Locale and deal with with previous iOS versions
     */
    public func saveReverseGeocodeLocation(_ location: CLLocation, preferredLocale locale: Locale?, completionHandler: @escaping CoreLocation.CLGeocodeCompletionHandler) {
        if #available(iOS 11.0, *) {
            reverseGeocodeLocation(location, preferredLocale: locale, completionHandler: completionHandler)
        } else {
            reverseGeocodeLocation(location, completionHandler: completionHandler)
        }
    }
}
