////
//  ProposalMultiDatePicker.swift
//  bug-free-goggles
//
//  Created by Mac on 05/06/23.
//

import SwiftUI
import SwiftUICalendar

struct ProposalDatePickerView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var calendarController =  CalendarController()
    @State var startDate: Date? = nil
    @State var endDate: Date? = nil
    var isMultipicker: Bool = false
    let onSet: (_ start: Date?, _ end: Date?) -> Void
    
    private var monthTitle: String{
        let yearMonth = calendarController.yearMonth
        return "\(yearMonth.monthShortString), \(yearMonth.year)"
    }
    
    private var selectionTitle: String? {
        guard let first = startDate,
              let last = endDate,
              first != last
        else {
            return nil
        }
        let startDateString = first.toString(format: .MMMdd)
        let endDateString = last.toString(format: .MMMdd)
        let year = last.toString(format: .yyyy)
        return "\(startDateString) - \(endDateString), \(year)"
    }
    
    private var title: String{
        let string = selectionTitle ?? monthTitle
        return string
    }
    
    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 4) {
                HStack(spacing: 8) {
                    Button(action: onPrevious) {
                        IconView(
                            image: "keyboard_arrow_left",
                            size: 16
                        )
                        .contentShape(Rectangle())
                    }
                    Text(title)
                        .font(.system(size: 20, weight: .semibold))
                    Button(action: onNext) {
                        IconView(
                            image: "keyboard_arrow_right",
                            size: 16
                        )
                        .contentShape(Rectangle())
                    }
                    Spacer()
                    CircleButton(size: 30, backgroundColor: .darkWhite) {
                        Image(systemName: "xmark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 10, height: 10)
                            .foregroundColor(.secondary)
                            .bold()
                            .contentShape(Circle())
                    } action: {
                        dismiss()
                    }
                    
                }
                .frame(height: 44)
                if isMultipicker{
                    CustomMultiDatePickerView(
                        startDate: $startDate,
                        endDate: $endDate
                    )
                }
                else{
                    CustomDatePickerView(
                        date: $startDate
                    )
                }
                
            }
            HStack(spacing: 12) {
                CapsuleButton(
                    title: "Cancel",
                    maxWidth: true,
                    backgroundColor: .darkWhite,
                    action: onCancel
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
            .font(.system(size: 17, weight: .semibold))
        }
        .padding(16)
        .environmentObject(calendarController)
    }
    
    private func onPrevious() {
        calendarController.scrollTo(
            calendarController.yearMonth.addMonth(value: -1),
            isAnimate: true
        )
    }
    
    private func onNext() {
        calendarController.scrollTo(
            calendarController.yearMonth.addMonth(value: 1),
            isAnimate: true
        )
    }
    
    func onCancel() {
        startDate = nil
        endDate = nil
        onSet(startDate, endDate)
        dismiss()
    }
}

struct ProposalDatePickerView_Previews: PreviewProvider {
    private struct Preview: View{
        let isMultipicker: Bool
        @State private var isPicker: Bool = true
        var body: some View{
            ZStack {}
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
                .contentShape(Rectangle())
                .onTapGesture {
                    isPicker.toggle()
                }
                .sheet(isPresented: $isPicker, content: {
                    ProposalDatePickerView(isMultipicker: isMultipicker) { start, end in
                        
                    }
                    .presentationDetents([.fraction(0.66)])
                })
        }
    }
    
    static var previews: some View {
        Preview(isMultipicker: false)
        
        Preview(isMultipicker: true)
    }
}
