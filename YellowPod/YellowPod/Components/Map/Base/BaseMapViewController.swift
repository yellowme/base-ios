//
//  BaseMapViewController.swift
//  Wawa
//
//  Created by Luis Burgos on 12/20/17.
//  Copyright © 2017 Yellowme. All rights reserved.
//

import UIKit
import MapKit

/**
 Defines a map component which cares about user current location.
 It also allows the user to custom decorate the Map by defining a
 implementation of the **BaseMapViewDecorator** class.
 
 This class also directly depends on PointAnnotation class.
 */
open class BaseMapViewController: UIViewController {
    //MARK: - Variables
    var decorator: BaseMapViewDecorator?
    internal var manager: CLLocationManager! = CLLocationManager()
    private var mMapView: MKMapView? {
        didSet {
            initializeBaseMap()
        }
    }
    
    //MARK: Getter
    func setMapView(_ mapView: MKMapView) {
        mMapView = mapView        
    }
    
    var getMap: MKMapView? {
        return mMapView
    }
}

//MARK: Map Setup
extension BaseMapViewController {
    internal func initializeBaseMap() {
        mMapView?.safeLet({ map in
            if #available(iOS 11.0, *) {
                map.register(
                    PointAnnotation.self,
                    forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier
                )
            }
            (decorator ?? self as? BaseMapViewDecorator)?.decorate()
            (self as? MapLocationAccessor)?.setupLocationManager()            
        })
    }
}

//MARK: Map Delegate
extension BaseMapViewController: MKMapViewDelegate {
    public func mapView(
        _ mapView: MKMapView,
        annotationView view: MKAnnotationView,
        calloutAccessoryControlTapped control: UIControl) {
        
        if let location = view.annotation as? Point {
            let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
            location.mapItem().openInMaps(launchOptions: launchOptions)
        }
    }
    
    /**
     Whenever a new annotation is added to the map we try that the
     map always fits the view showing all annotations.
     */
    public func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        mMapView?.fitToAnnotaionList()
    }        
}
