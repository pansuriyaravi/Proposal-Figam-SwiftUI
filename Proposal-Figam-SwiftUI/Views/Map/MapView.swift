//
//  MapView.swift
//  bug-free-goggles
//
//  Created by Viswanath Reddy on 06/05/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject private var mapViewVM: MapViewModel
    @Binding var enlargeMapView:Bool
    
    var height: CGFloat = 450
    // MARK: - BODY
    var body: some View {
        Map(
            coordinateRegion: $mapViewVM.region,
            showsUserLocation: true,
            annotationItems: mapViewVM.annotationItems,
            annotationContent: { location in
                MapAnnotation(
                    coordinate: location.coordinate,
                    content: {
                        AddressAnnotationView(title: location.title)
                    }
                )
            }
        )
        .frame(minHeight: enlargeMapView ? getScreenBounds().height - 150 : height)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(
            HStack (spacing: 2) {
                Spacer()
                
                Button {
                    mapViewVM.zoomOut()
                } label: {
                    IconView(image: "zoomout", size: 32)
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.08), radius: 0.1)
                }
                
                Button {
                    mapViewVM.zoomIn()
                } label: {
                    IconView(image: "zoomin", size: 32)
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.08), radius: 0.1)
                }
                
            }
            .padding([.trailing, .bottom], 20),
            alignment: .bottomTrailing
        )
        .overlay(
            Button {
                enlargeMapView.toggle()
            } label: {
                IconView(image: "enlarge", size: 32)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.08), radius: 0.1)
            }
            .padding([.trailing, .top], 20),
            alignment: .topTrailing
        )
        .zIndex(1)
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(enlargeMapView: .constant(true))
        .environmentObject(MapViewModel())
    }
}
