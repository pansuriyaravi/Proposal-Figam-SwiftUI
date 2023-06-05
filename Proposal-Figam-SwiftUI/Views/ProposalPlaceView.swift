////
//  ProposalPlaceView.swift
//  bug-free-goggles
//
//  Created by Mac on 01/06/23.
//

import SwiftUI

struct ProposalPlaceView: View {
    @StateObject private var mapViewModel = MapViewModel()
    @StateObject private var addressSearchViewModel = AddressSearchViewModel()
    @State private var enlargeMapView = false
    @State private var toShareView: Bool = false
    
    var body: some View {
        ProposalWrapperView(
            isFooterVisible: !enlargeMapView,
            onNext: onNext
        ) {
            content
        }
        .navigationDestination(isPresented: $toShareView) {
            ProposalShareView()
        }
        .environmentObject(mapViewModel)
        .environmentObject(addressSearchViewModel)
    }
    
    var content: some View{
        ScrollView {
            VStack {
                if !enlargeMapView {
                    HeaderView(
                        title: "Where's your place located?",
                        subtitle: "In this step, we'll ask you which type of stays you have and if guests will book the entire place or just a room."
                    )
                    
                    AddressSearchTextField()
                }
                
                MapWithPlacesListView(enlargeMapView: $enlargeMapView)
            
            }
            .padding([.top, .horizontal], 16)
        }
    }
    
    func onNext() {
        toShareView = true
    }
}

struct ProposalPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProposalPlaceView()
        }
    }
}
