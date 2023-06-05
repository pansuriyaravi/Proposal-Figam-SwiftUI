////
//  DayHourPickerView.swift
//  bug-free-goggles
//
//  Created by Mac on 31/05/23.
//

import SwiftUI

struct DayHourPickerView: View {
    @Binding var picker: Picker
    var pickers: [Picker] = [.hour, .day]
    var selectionBackgroundColor: Color = .appPrimary
    
    enum Picker: String, CaseIterable{
        case hour
        case day
        case month
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(pickers, id: \.self) { type in
                let isSelected = type == picker
                CapsuleButton(
                    title: type.rawValue.capitalized,
                    horizontalPadding: 16,
                    verticalPadding: 9,
                    foregroundColor: isSelected ? .white : Color.stormyBlue,
                    backgroundColor: isSelected ? selectionBackgroundColor : Color.clear
                ) {
                    onSelect(type)
                }
            }
        }
    }
    
    func onSelect(_ value: Picker){
        picker = value
    }
}

struct DayHourPickerView_Previews: PreviewProvider {
    private struct Preview: View{
        @State var picker: DayHourPickerView.Picker = .hour
        var body: some View{
            DayHourPickerView(picker: $picker)
        }
    }
    
    private struct PreviewMonth: View{
        @State var picker: DayHourPickerView.Picker = .hour
        var body: some View{
            DayHourPickerView(
                picker: $picker,
                pickers: DayHourPickerView.Picker.allCases
            )
        }
    }
    static var previews: some View {
        Preview()
        PreviewMonth()
    }
}
