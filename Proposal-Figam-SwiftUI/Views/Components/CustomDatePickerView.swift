////
//  CustomDatePickerView.swift
//  bug-free-goggles
//
//  Created by Mac on 05/06/23.
//

import SwiftUI
import SwiftUICalendar

struct CustomDatePickerView: View {
    private typealias CalendarView = SwiftUICalendar.CalendarView
    @EnvironmentObject private var controller: CalendarController
    @Binding var date: Date?
    
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
                GeometryReader { geometry in
                    ZStack{
                        if selected {
                            Color.appPrimary
                                .cornerRadius(8)
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
        self.date = date
    }
    
    func isSelected(date: Date?) -> Bool {
        return date == self.date
    }
}

struct CustomDatePickerView_Previews: PreviewProvider {
    private struct Preview: View {
        @State var date: Date? = nil
        var body: some View{
            CustomDatePickerView(date: $date)
                .environmentObject(CalendarController())
        }
    }
    static var previews: some View {
        Preview()
    }
}
