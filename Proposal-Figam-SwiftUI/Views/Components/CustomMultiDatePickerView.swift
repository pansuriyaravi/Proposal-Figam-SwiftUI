////
//  ProposalDatesSelectionView.swift
//  bug-free-goggles
//
//  Created by Mac on 05/06/23.
//

import SwiftUI
import SwiftUICalendar

struct CustomMultiDatePickerView: View {
    private typealias CalendarView = SwiftUICalendar.CalendarView
    @EnvironmentObject private var controller: CalendarController
    @State private var selection: [Date] = []
    @Binding var startDate: Date?
    @Binding var endDate: Date?
    
    var body: some View {
        CalendarView(
            controller,
            header: { week in
                GeometryReader { geometry in
                    Text(week.shortString.uppercased())
                        .kerning(-0.8)
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.secondaryGray.opacity(0.5))
                        .frame(
                            width: geometry.size.width,
                            height: geometry.size.height,
                            alignment: .center
                        )
                }
            },
            component: { date in
                let currentDate = date.date
                let isFocusYearMonth = date.isFocusYearMonth ??  false
                let selected = isSelected(date: currentDate)
                let corners = getCorners(date: currentDate)
                GeometryReader { geometry in
                    ZStack{
                        if selected {
                            if let corners = corners{
                                Color.appPrimary
                                    .cornerRadius(8, corners: corners)
                            }
                            else {
                                Color.appPrimary

                            }
                        }
                        Text("\(date.day)")
                            .font(.system(size: 20, design: .default))
                            .foregroundColor(selected ? .white : nil)
                    }
                    .opacity(isFocusYearMonth == true ? 1 : 0)
                    .padding(.vertical, 2)
                    .frame(
                        width: geometry.size.width,
                        height: geometry.size.height,
                        alignment: .center
                    )
                    .contentShape(Rectangle())
                    .onTapGesture {
                        onSelect(date: currentDate)
                    }
                    .disabled(!isFocusYearMonth)
                }
            }
        )
    }
    
    func onSelect(date: Date?) {
        guard let date = date else {
            return
        }
        if let startDate = startDate, startDate != date, endDate == nil {
            let dates: [Date]
            if startDate < date {
                dates = Date.generateDateArray(from: startDate, to: date)
            }
            else if date < startDate {
                dates = Date.generateDateArray(from: date, to: startDate)
            }
            else {
                dates = []
            }
            selection = dates.sorted()
            self.startDate = selection.first
            endDate = selection.last
        }
        // Start new selection when both dates were present or both are empty
        else {
            startDate = date
            self.endDate = nil
            selection = [date]
        }
    }
    
    func isSelected(date: Date?) -> Bool {
        guard let date = date else {
            return false
        }
        let contains = selection.contains(date)
        return contains
    }
    
    func getCorners(date: Date?) -> UIRectCorner? {
        guard let date = date else {
            return .none
        }
        let isStart = date == startDate
        let isEnd = date == endDate
        if isStart && endDate == nil{
            return .allCorners
        }
        else if isStart {
            return [.topLeft, .bottomLeft]
        }
        else if isEnd {
            return [.topRight, .bottomRight]
        }
        return .none
    }
}

struct ProposalDatesSelectionView_Previews: PreviewProvider {
    private struct Preview: View {
        @State var startDate: Date? = nil
        @State var endDate: Date? = nil
        
        var body: some View {
            CustomMultiDatePickerView(startDate: $startDate, endDate: $endDate)
                .environmentObject(CalendarController())
        }
    }
    
    static var previews: some View {
        Preview()
    }
}
