//
//  ContentView.swift
//  Proposal-Figam-SwiftUI
//
//  Created by mac on 05/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ProposalAvailabilityView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
