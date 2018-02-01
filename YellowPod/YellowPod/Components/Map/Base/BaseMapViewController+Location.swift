//
//  BaseMapViewController+Location.swift
//  Wawa
//
//  Created by Luis Burgos on 12/21/17.
//  Copyright © 2017 Yellowme. All rights reserved.
//

import Foundation
import MapKit

protocol MapLocationAccessor {
    func setupLocationManager()
    func checkLocationAuthStatus()
    func handleLocationManager(status: CLAuthorizationStatus)
}

//MARK: Internal API
extension MapLocationAccessor where Self: BaseMapViewController {
    func setupLocationManager() {
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkLocationAuthStatus() {
        handleLocationManager(status: CLLocationManager.authorizationStatus())
    }
    
    func handleLocationManager(status: CLAuthorizationStatus) {
        guard status == .authorizedAlways else {
            manager.requestAlwaysAuthorization()
            return
        }
        getMap?.showsUserLocation = true
        getMap?.userTrackingMode = .follow
        manager.startUpdatingLocation()
    }
}

//MARK: Location Manager
extension BaseMapViewController: CLLocationManagerDelegate {
    //MARK: Delegate
    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        debugPrint("Change status to \(status.rawValue)")
        (self as? MapLocationAccessor)?.handleLocationManager(status: status)
    }
    
    //TODO: Evaluate move to concrete Map implementation
    public func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        //TODO: Activated the UI
    }
    
    public func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        //TODO: Alert user service is currently only for certain regions
        //TODO: Block the UI
    }
}
