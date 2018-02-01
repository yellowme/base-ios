//
//  MapOptions.swift
//  Wawa
//
//  Created by Luis Burgos on 1/26/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit
import CoreLocation.CLLocation

private class MapOptionsReference {
    var maxToleranceInKM: Double?
    var center: CLLocationCoordinate2D?
    var northEast: CLLocationCoordinate2D?
    var southWest: CLLocationCoordinate2D?
    func bounds() -> (ne: CLLocationCoordinate2D, sw: CLLocationCoordinate2D) {
        return(ne: MapOptions.shared.northEast!, sw: MapOptions.shared.southWest!)
    }
}

class MapOptions {
    var maxToleranceInKM: Double?
    var center: CLLocationCoordinate2D?
    var northEast: CLLocationCoordinate2D?
    var southWest: CLLocationCoordinate2D?
    
    static let shared = MapOptions()
    private static let setup = MapOptions()
    
    class func setup(
        maxToleranceInKM: Double,
        center: CLLocationCoordinate2D,
        northEast: CLLocationCoordinate2D,
        southWest: CLLocationCoordinate2D
    ){
        MapOptions.setup.maxToleranceInKM = maxToleranceInKM
        MapOptions.setup.center = center
        MapOptions.setup.northEast = northEast
        MapOptions.setup.southWest = southWest
    }
    
    private init() {
        guard let maxToleranceInKM = MapOptions.setup.maxToleranceInKM else {
            fatalError("Error - you must call setup before accessing map options")
        }
        
        guard let center = MapOptions.setup.center else {
            fatalError("Error - you must call setup before accessing map options")
        }
        
        guard let northEast = MapOptions.setup.northEast else {
            fatalError("Error - you must call setup before accessing map options")
        }
        
        guard let southWest = MapOptions.setup.southWest else {
            fatalError("Error - you must call setup before accessing map options")
        }
        
        self.maxToleranceInKM = maxToleranceInKM
        self.center = center
        self.northEast = northEast
        self.southWest = southWest
    }
    
    func asLocation(_ coordinate: CLLocationCoordinate2D) -> CLLocation {
        return CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
    }
    
    func isTolaranceInside(for coordinate: CLLocationCoordinate2D) -> Bool {
        let centerLocation = MapOptions.shared.asLocation(MapOptions.shared.center!)
        let coordinateLocation = MapOptions.shared.asLocation(coordinate)
        let distanceInMeters = coordinateLocation.distance(from: centerLocation)
        return distanceInMeters <= maxToleranceInKM!
    }
}
