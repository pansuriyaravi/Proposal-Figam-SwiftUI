////
//  ProposalHeadingView.swift
//  bug-free-goggles
//
//  Created by Mac on 01/06/23.
//

import SwiftUI

struct ProposalHeadingView: View {
    @State var heading = ""
    @State var note = ""
    var body: some View {
        ProposalWrapperWithHeaderView(
            title: "Let's give your house a title",
            subtitle: "Short titles work best. Have fun with it – you can always change it later.",
            isNextDisable: true,
            onNext: onNext
        ) {
            HeadingNoteView(heading: $heading, note: $note)
        }
    }
    
    func onNext() {
        
    }
}

struct ProposalHeadingView_Previews: PreviewProvider {
    static var previews: some View {
        ProposalHeadingView()
    }
}
