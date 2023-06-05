////
//  ProposalAvailabilityView.swift
//  bug-free-goggles
//
//  Created by Mac on 31/05/23.
//

import SwiftUI

struct ProposalAvailabilityView: View {
    @State private var picker: DayHourPickerView.Picker = .day
    @State private var startDate: Date? = nil
    @State private var endDate: Date? = nil
    @State private var toMultiDatePicker: Bool = false
    @State private var toDatePicker: Bool = false
    @State private var toTimePicker: Bool = false
    @State private var startTime: Date? = nil
    @State private var endTime: Date? = nil
    @State private var toPricingView: Bool = false
    
    
    var body: some View {
        ProposalWrapperWithHeaderView(
            title: "Give your availability",
            subtitle: "In this step, we'll ask you which type of stays you have and if guests will book the entire place or just a room.",
            onNext: onNext
        ) {
            content
        }
        .navigationDestination(isPresented: $toPricingView) {
            ProposalPricingView()
        }
    }
    
    private var content: some View{
        VStack(alignment: .leading, spacing: 12) {
            DayHourPickerView(picker: $picker, selectionBackgroundColor: .darkIndigo)
            
            if picker == .hour {
                hourFields
            }
            else {
                dayFields
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
    
    private var hourFields: some View{
        VStack(alignment: .leading, spacing: 12) {
            FieldView(label: "Date") {
                let date = startDate?.toString(format: .ddMMyyyySlashed)
                let placeholder = Date().toString(format: .ddMMyyyySlashed)
                BorderedCapsuleButton(
                    title: date ?? placeholder,
                    trailingImage: "calendar",
                    spacing: 16,
                    horizontalPadding: 20,
                    verticalPadding: 12,
                    foregroundColor: date == nil ? .gray : .black,
                    borderColor: .neutral700,
                    action: {
                        toDatePicker = true
                    }
                )
                .font(.inter(size: 15, weight: .medium))
            }
            .sheet(isPresented: $toDatePicker, content: {
                ProposalDatePickerView(
                    onSet: { start, end in
                        onSet(start: start, end: end)
                    }
                )
                .presentationDetents([.fraction(0.6)])
            })
            let placeholder = "08:00 AM - 12:00 AM"
            let multiTimeString = getMultiTimeString()
            FieldView(label: "Time") {
                BorderedCapsuleButton(
                    title: multiTimeString ?? placeholder,
                    trailingImage: "time",
                    spacing: 24,
                    horizontalPadding: 20,
                    verticalPadding: 12,
                    foregroundColor: multiTimeString == nil ? .gray : .black,
                    borderColor: .neutral700,
                    action: {
                        toTimePicker = true
                    }
                )
                .font(.inter(size: 15, weight: .medium))
            }
            .sheet(isPresented: $toTimePicker) {
                ProposalMultiTimePickerView { start, end in
                    startTime = start
                    endTime = end
                }
            }
        }
    }
    
    private var dayFields: some View{
        FieldView(label: "Date") {
            let placeholder = Date.string(
                start: Date(),
                end: Date().addingTimeInterval(2 * 24 * 3600),
                formate: .ddMMyyyySlashed
            )
            let multiDateString = getMultiDateString()
            BorderedCapsuleButton(
                title: multiDateString ?? placeholder,
                trailingImage: "calendar",
                spacing: 16,
                horizontalPadding: 20,
                verticalPadding: 12,
                foregroundColor: multiDateString == nil ? .gray : .black,
                borderColor: .neutral700,
                action: {
                    toMultiDatePicker = true
                }
            )
            .font(.inter(size: 15, weight: .medium))
        }
        .sheet(isPresented: $toMultiDatePicker, content: {
            ProposalDatePickerView(
                isMultipicker: true,
                onSet: { start, end in
                    onSet(start: start, end: end)
                }
            )
            .presentationDetents([.fraction(0.6)])
        })
    }
    
    private func onNext() {
        toPricingView = true
    }
    
    private func onSet(start: Date?, end: Date?){
        startDate = start
        endDate = end
    }
    
    private func getMultiDateString() -> String? {
        guard let startDate = startDate, let endDate = endDate else {
            return nil
        }
        return Date.string(start: startDate, end: endDate, formate: .ddMMyyyySlashed)
    }
    
    private func getMultiTimeString() -> String? {
        guard let startTime = startTime, let endTime = endTime else {
            return nil
        }
        return Date.string(start: startTime, end: endTime, formate: .hhmma)
    }
}

struct ProposalAvailabilityView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProposalAvailabilityView()
        }
    }
}
