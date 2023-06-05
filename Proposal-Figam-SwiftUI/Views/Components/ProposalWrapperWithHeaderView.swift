////
//  ProposalWrapperWithHeaderView.swift
//  bug-free-goggles
//
//  Created by Mac on 01/06/23.
//

import SwiftUI

struct ProposalWrapperWithHeaderView<Content: View>: View {
    let title: String
    let subtitle: String
    var isNextDisable: Bool = false
    var onBack: (() -> Void)? = nil
    let onNext: () -> Void
    @ViewBuilder let content: Content
    var body: some View {
        ProposalWrapperView(isNextDisable: isNextDisable, onBack: onBack, onNext: onNext) {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    HeaderView(
                        title: title,
                        subtitle: subtitle
                    )
                    content
                }
                .padding([.top, .horizontal], 16)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }
        }
    }
}

struct ProposalWrapperWithHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProposalWrapperWithHeaderView(
                title: "Give your availability",
                subtitle: "In this step, we'll ask you which type of stays you have and if guests will book the entire place or just a room.",
                onNext: {}
            ) {
                Color.blue
            }
        }
        
    }
}
