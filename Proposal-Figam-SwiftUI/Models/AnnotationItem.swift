//
//  AnnotationItem.swift
//  cheffy
//
//  Created by Viswanath Reddy on 07/05/23.
//

import Foundation
import MapKit

struct AnnotationItem: Identifiable  {
    let id = UUID()
    let latitude: Double
    let longitude: Double
    let title: String
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
