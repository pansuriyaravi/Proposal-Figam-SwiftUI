////
//  ProposalImageUploadView.swift
//  bug-free-goggles
//
//  Created by Mac on 01/06/23.
//

import SwiftUI

struct ProposalImageUploadView: View {
    @State var images: [Image] = []
    @State private var toHeadingiew: Bool = false

    var body: some View {
        ProposalWrapperWithHeaderView(
            title: "Upload Images",
            subtitle: "Choose at least 6 pictures.",
            isNextDisable: images.isEmpty,
            onNext: onNext
        ) {
            PickImageListView(selectedImages: $images)
        }
        .navigationDestination(isPresented: $toHeadingiew) {
            ProposalHeadingView()
        }
    }
    
    func onNext() {
        toHeadingiew = true
    }
}

struct ProposalImageUploadView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProposalImageUploadView()
        }
    }
}
