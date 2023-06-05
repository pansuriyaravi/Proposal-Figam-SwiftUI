////
//  StepperRowView.swift
//  bug-free-goggles
//
//  Created by Mac on 10/05/23.
//

import SwiftUI

struct StepperRowView: View {
    var title:String
    @Binding var stepValue:Int
    var spacing: CGFloat = 16
    var maxWidth: CGFloat? = nil
    var maxVal: Int = 10

    var body: some View {
        HStack{
            Text(title)
                .font(.inter(size: 17, weight: .semibold))
            
            Spacer()
            
            HStack(spacing: spacing) {
                BorderedCircleButton(size: 56, borderColor: .neutral700) {
                    IconView(image: "minus_icon", size: 24)
                } action: {
                   onMinus()
                }
                
                Text(stepValue.twoDigitString)
                    .font(.inter(size: 18, weight: .semibold))
                    .frame(maxWidth: maxWidth)
                
                BorderedCircleButton(size: 56, borderColor: .neutral700) {
                    IconView(image: "plus_icon", size: 24)
                } action: {
                   onPlus()
                }
            }
        }
    }
    
    func onMinus(){
        if stepValue > 0 {
            stepValue -= 1
        }
    }
    
    func onPlus(){
        if stepValue < maxVal {
            stepValue += 1
        }
    }
}

struct StepperRowView_Previews: PreviewProvider {
    private struct Preview: View{
        @State var value: Int = 0
        var body: some View{
            StepperRowView(title: "Persons", stepValue: $value)
        }
    }
    static var previews: some View {
        Preview()
    }
}
