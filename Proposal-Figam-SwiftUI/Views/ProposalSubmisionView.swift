////
//  ProposalSubmisionView.swift
//  bug-free-goggles
//
//  Created by Mac on 31/05/23.
//

import SwiftUI

struct ProposalSubmisionView: View {
    var body: some View {
        ProposalAvailabilityView()
    }
}

struct ProposalSubmisionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProposalSubmisionView()
        }
    }
}
