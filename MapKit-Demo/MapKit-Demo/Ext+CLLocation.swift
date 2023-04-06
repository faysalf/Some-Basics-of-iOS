//
//  Ext+CLLocation.swift
//  MapKit-Demo
//
//  Created by Md. Faysal Ahmed on 5/4/23.
//

import UIKit
import CoreLocation

extension CLLocation {
    
    func lookUpPlaceMark(_ handler: @escaping (CLPlacemark?) -> Void) {
        
        let geocoder = CLGeocoder()
            
        // Look up the location and pass it to the completion handler
        geocoder.reverseGeocodeLocation(self) { (placemarks, error) in
            if error == nil {
                let firstLocation = placemarks?[0]
                handler(firstLocation)
            }
            else {
                // An error occurred during geocoding.
                handler(nil)
            }
        }
    }
    
    // this handler gives us full location
    func lookUpLocationName(_ handler: @escaping (String?) -> Void) {
        
        lookUpPlaceMark { (placemark) in
            handler("\(placemark)")
        }
    }
    
    
}
