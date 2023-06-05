////
//  MapWithPlacesListView.swift
//  bug-free-goggles
//
//  Created by Mac on 01/06/23.
//

import SwiftUI
import MapKit

struct MapWithPlacesListView: View {
    @EnvironmentObject private var mapViewModel: MapViewModel
    @EnvironmentObject private var addressSearchViewModel: AddressSearchViewModel
    @Binding var enlargeMapView: Bool
    var isAppendItems: Bool = false
    
    var body: some View {
        MapView(enlargeMapView: $enlargeMapView)
            .overlay(list, alignment: .top)
    }
    
    private var list: some View{
        List(addressSearchViewModel.results) { address in
            Button {
                mapViewModel.getPlace(from: address, isAppend: isAppendItems) // To get Map region for selected address.
                addressSearchViewModel.clear() // To clear search and dropPin
            } label: {
                VStack(alignment: .leading) {
                    Text(address.title)
                    Text(address.subtitle)
                        .font(.caption)
                }
            }
            .padding(.bottom, 2)
        }
        .listStyle(.plain)
        .frame(minHeight: 100, maxHeight: 300)
        .opacity(addressSearchViewModel.results.isEmpty ? 0 : 1)

    }
}

struct MapWithPlacesListView_Previews: PreviewProvider {
    static let mapVM = MapViewModel()
    static let addressVM = AddressSearchViewModel()
    
    static var previews: some View {
        MapWithPlacesListView(enlargeMapView: .constant(false))
            .environmentObject(mapVM)
            .environmentObject(addressVM)
        
        MapWithPlacesListView(enlargeMapView: .constant(true))
            .environmentObject(mapVM)
            .environmentObject(addressVM)
    }
}
