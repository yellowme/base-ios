//
//  InfoPlistHelper.swift
//  YellowPod
//
//  Created by Luis Burgos on 12/19/17.
//  Copyright © 2017 Yellowme. All rights reserved.
//

import Foundation

enum InfoPlistKey: String {
    case googleMaps = "GOOGLE_MAPS_API_KEY"
    case api = "CORE_API_URL"
}

class InfoPlistHelper {
    class func lookUpFor(_ key: InfoPlistKey) -> Any? {
        guard let infoPlist = Bundle.main.infoDictionary, let value = infoPlist[key.rawValue] else {
            debugPrint("There is no info plist value")
            return nil
        }
        debugPrint("Looking for \(value) for key \(key)")
        return value
    }
}

enum ResourcesNames: String {
    case mapSkin = "map-skin"
}

class BundleHelper {
    class func jsonFileURL(for resourceName: ResourcesNames) -> URL? {
        guard let overlayFileURLString = Bundle.main.path(forResource: resourceName.rawValue, ofType: "json") else {
            return nil
        }
        return URL(fileURLWithPath: overlayFileURLString)
    }
}
