////
//  ProposalMultiTimePickerView.swift
//  bug-free-goggles
//
//  Created by Mac on 05/06/23.
//

import SwiftUI

struct ProposalMultiTimePickerView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var startDate: Date = Date()
    @State private var endDate: Date = Date()
    let onSet: (_ start: Date, _ end: Date) -> Void
    
    var body: some View {
        VStack{
            Spacer()
            Text("Start Time")
            DatePicker("", selection: $startDate, displayedComponents: .hourAndMinute)
                .datePickerStyle(.wheel)
                .labelsHidden()
            Text("End Time")
            DatePicker("", selection: $endDate, displayedComponents: .hourAndMinute)
                .datePickerStyle(.wheel)
                .labelsHidden()
            HStack(spacing: 12) {
                CapsuleButton(
                    title: "Cancel",
                    maxWidth: true,
                    backgroundColor: .darkWhite,
                    action: {
                        dismiss()
                    }
                )
                CapsuleButton(
                    title: "Set",
                    maxWidth: true,
                    foregroundColor: .white,
                    backgroundColor: .black,
                    action: {
                       onSet(startDate, endDate)
                        dismiss()
                    }
                )
            }
            .padding()
        }
        .font(.system(size: 17, weight: .semibold))
    }
}

struct ProposalMultiTimePickerView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {}
            .sheet(isPresented: .constant(true)) {
                ProposalMultiTimePickerView { start, end in
                    
                }
            }
    }
}
