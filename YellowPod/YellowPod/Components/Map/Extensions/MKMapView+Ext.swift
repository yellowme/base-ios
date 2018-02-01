//
//  MKMapView+Ext.swift
//  YellowPod
//
//  Created by Luis Burgos on 12/21/17.
//  Copyright © 2017 Yellowme. All rights reserved.
//

import Foundation
import MapKit

public enum CenterZooming {
    case same
    case zoomIn
    case zoomOut
}

//MARK: - Center
extension MKMapView {
    /**
     Decides wheter call center(on coordinate) or center(on coordinate, with altitude) methods.
     */
    func center(on location: CLLocation) -> Void {
        center(on: location.coordinate)
    }
    
    
    /**
     Updates the center coordinate without change the current altitude on map camera.
     */
    func center(on coordinate: CLLocationCoordinate2D) -> Void {
        camera.centerCoordinate = coordinate
    }
    
    func centerAnimated(using zoomType: CenterZooming) {
        switch zoomType {
        case .zoomIn:
            zoomIn()
            break;
        case .zoomOut:
            zoomOut()
            break
        default:
            break
        }
    }
}

extension MKMapView {
    //MARK: - Fit Map
    func fitToAnnotaionList() -> Void {
        let mapEdgePadding = UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40)
        var zoomRect: MKMapRect = MKMapRectNull
        
        for index in 0..<self.annotations.count {
            let annotation = self.annotations[index]
            let aPoint: MKMapPoint = MKMapPointForCoordinate(annotation.coordinate)
            let rect: MKMapRect = MKMapRectMake(aPoint.x, aPoint.y, 0.1, 0.1)
            
            if MKMapRectIsNull(zoomRect) {
                zoomRect = rect
            } else {
                zoomRect = MKMapRectUnion(zoomRect, rect)
            }
        }
        self.setVisibleMapRect(zoomRect, edgePadding: mapEdgePadding, animated: true)
    }
    
    //MARK: - Clear Map
    func clearAnnotations() {
        //removeOverlays(overlays)
        let annotationsToRemove = annotations.filter { $0 !== userLocation }
        removeAnnotations( annotationsToRemove )
    }
    
    //MARK: - Hiding
    func hideAllAnnotations() {
        let annotationsToHide = annotations.filter { $0 !== userLocation }
        for annotation in annotationsToHide {            
            view(for: annotation)?.isHidden = true
            view(for: annotation)?.canShowCallout = false
        }
    }
}
