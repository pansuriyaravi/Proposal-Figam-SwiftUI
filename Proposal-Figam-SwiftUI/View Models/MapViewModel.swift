//
//  MapViewModel.swift
//  cheffy
//
//  Created by Viswanath Reddy Ponthota on 07/05/23.
//

import Foundation
import MapKit

class MapViewModel: ObservableObject {
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)) // default location kept London
    
    @Published private(set) var annotationItems: [AnnotationItem] = []
    @Published var selectedAddress: AddressResult?
    
    func getPlace(from address: AddressResult, isAppend: Bool = false) {
        let request = MKLocalSearch.Request()
        let title = address.title
        let subTitle = address.subtitle
        
        request.naturalLanguageQuery = subTitle.contains(title)
        ? subTitle : title + ", " + subTitle
        
        Task {
            let response = try await MKLocalSearch(request: request).start()
            await MainActor.run {
                if isAppend {
                    let item = response.mapItems[0]
                    
                    self.annotationItems.append(
                        AnnotationItem(
                            latitude: item.placemark.coordinate.latitude,
                            longitude: item.placemark.coordinate.longitude,
                            title: item.placemark.title ?? ""
                        )
                    )
                } else {
                    self.annotationItems = response.mapItems.map {
                        AnnotationItem(
                            latitude: $0.placemark.coordinate.latitude,
                            longitude: $0.placemark.coordinate.longitude,
                            title: $0.placemark.title ?? "")
                    }
                }
                
                self.selectedAddress = address
                self.region = response.boundingRegion
            }
        }
    }
    
    func removePlace(annotatioItem: AnnotationItem) {
        if let index = self.annotationItems.firstIndex(where: {$0.id == annotatioItem.id}) {
            self.annotationItems.remove(at: index)
        }
    }
    
    func zoomIn(){
        region.span =  MKCoordinateSpan(
            latitudeDelta: region.span.latitudeDelta * 0.5,
            longitudeDelta: region.span.latitudeDelta * 0.5
        )
    }
    
    func zoomOut(){
        region.span =  MKCoordinateSpan(
            latitudeDelta: region.span.latitudeDelta / 0.5,
            longitudeDelta: region.span.latitudeDelta / 0.5
        )
    }
}
