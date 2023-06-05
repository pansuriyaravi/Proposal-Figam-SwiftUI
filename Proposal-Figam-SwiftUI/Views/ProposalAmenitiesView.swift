////
//  ProposalAmenitiesView.swift
//  bug-free-goggles
//
//  Created by Mac on 01/06/23.
//

import SwiftUI

struct ProposalAmenitiesView: View {
    @State var amenities: Set<Amenity> = []
    @State var standeredAmenities: Set<Amenity> = []
    @State private var toImageUploadView: Bool = false
    
    var body: some View {
        ProposalWrapperWithHeaderView(
            title: "What are the amenities that room have have?",
            subtitle: "In this step, we'll ask you which type of stays you have and if guests will book the entire place or just a room.",
            onNext: onNext
        ) {
            content
        }
        .navigationDestination(isPresented: $toImageUploadView) {
            ProposalImageUploadView()
        }
    }
    
    var content: some View{
        VStack(alignment: .leading, spacing: 16) {
            AmenitiesSelectionView(
                amenities: .basic,
                selection: $amenities
            )
            .padding(.horizontal, -16)

            Text("Any standout amenities?")
                .font(.footnote)
                .foregroundColor(.secondary)
            
            AmenitiesSelectionView(
                amenities: .standout,
                selection: $amenities
            )
            .padding(.horizontal, -16)
        }
    }
    
    func onNext() {
        toImageUploadView = true
    }
}

struct ProposalAmenitiesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProposalAmenitiesView()
        }
    }
}
