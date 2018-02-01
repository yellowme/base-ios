//
//  MKMapView+Zoom.swift
//  Wawa
//
//  Created by Luis Burgos on 1/24/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation
import MapKit

//MARK: - Zoom
extension MKMapView {
    /**
     Updates the center coordinate and MODIFIES the camera altitude for the map
     but depending on the "zoomOutDelta" paramter value.
     */
    fileprivate func setZoomUsingCenter(zoomOutDelta: CLLocationDegrees = 0.18) -> Void {
        let coordinateRegion = MKCoordinateRegionMake(centerCoordinate, MKCoordinateSpanMake(zoomOutDelta, zoomOutDelta))
        setRegion(coordinateRegion, animated: true)
    }
    
    //MARK: - Public API
    
    func zoomIn(animated: Bool = true) {
        setZoomUsingCenter(zoomOutDelta: 0.003)
    }
    
    func zoomOut(animated: Bool = true) {
        setZoomUsingCenter()
    }
}
