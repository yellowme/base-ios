//
//  BasePointAnnotation.swift
//  Wawa
//
//  Created by Luis Burgos on 12/20/17.
//  Copyright © 2017 Yellowme. All rights reserved.
//
import Foundation
import MapKit

enum PointType: String {
    case none = "none"
    
    //MARK: Custom types
    case userChoise = "pin"
    
    //HERE: You can add more pin types
}

/**
 Simple definition of an annotation with title and location associated.
 */
class Point: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    let type: PointType
    
    init(title: String, coordinate: CLLocationCoordinate2D, type: PointType = .none) {
        self.title = title
        self.coordinate = coordinate
        self.type = type
        super.init()
    }
    
    func mapItem() -> MKMapItem {
        let placemark = MKPlacemark(coordinate: coordinate)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        return mapItem
    }
}

/**
 Related to the **Point** class, provides a simple annotation view for display
 */
class PointAnnotation: MKAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            guard let point = newValue as? Point else { return }
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            if point.type != .none {
                image = UIImage(named: point.type.rawValue)
            }
        }
    }
}
