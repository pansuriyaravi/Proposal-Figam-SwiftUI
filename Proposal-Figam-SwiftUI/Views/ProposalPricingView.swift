////
//  ProposalPricingView.swift
//  bug-free-goggles
//
//  Created by Mac on 31/05/23.
//

import SwiftUI

struct ProposalPricingView: View {
    @State var price: Int = 0
    @State private var toRoomDescriptionView: Bool = false
    
    var body: some View {
        ProposalWrapperWithHeaderView(
            title: "Give your pricing",
            subtitle: "In this step, we'll ask you which type of stays you have and if guests will book the entire place or just a room.",
            onNext: onNext
        ) {
            content
        }
        .navigationDestination(isPresented: $toRoomDescriptionView) {
            ProposalRoomDescriptionView()
        }
    }
    
    var content: some View{
        VStack(alignment: .leading, spacing: 12) {
            PricingPerDayStepperView(value: $price)
            Text("His Bid rate is $75 to $90")
                .font(.inter(size: 14))
                .foregroundColor(.lightGrayText)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
    
    func onNext() {
        toRoomDescriptionView = true
    }
}

struct ProposalPricingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProposalPricingView()
        }
    }
}
