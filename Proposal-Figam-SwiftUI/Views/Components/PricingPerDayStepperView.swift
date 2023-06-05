////
//  PricingStepperView.swift
//  bug-free-goggles
//
//  Created by Mac on 31/05/23.
//

import SwiftUI

struct PricingPerDayStepperView: View {
    @Binding var value: Int
    var minimun: Double = 0
    var maximum: Double = .infinity
    var intervalType: String = "Day"
    
    var body: some View {
        HStack(spacing: 18) {
            BorderedCircleButton(size: 56, borderColor: .neutral700) {
                IconView(image: "plus_icon", size: 24)
            } action: {
                onPlus()
            }
            BorderedCapsuleButton(
                title: "USD $\(value) / Per \(intervalType)",
                horizontalPadding: 26,
                verticalPadding: 12 + 4, // Extra 4 for line height
                maxWidth: .infinity,
                borderColor: .neutral700,
                action: {
                    // TODO: add time picker
                }
            )
            .font(.inter(size: 15, weight: .semibold))
            BorderedCircleButton(size: 56, borderColor: .neutral700) {
                IconView(image: "minus_icon", size: 24)
            } action: {
                onMinus()
            }
        }
    }
    
    func onPlus(){
        if maximum == .infinity {
            value += 1
        }
        else {
            value = min(Int(maximum), value + 1)
        }
    }
    
    func onMinus(){
        value = max(Int(minimun), value - 1)
    }
}

struct PricingStepperView_Previews: PreviewProvider {
    private struct Preview: View {
        @State var value: Int = 0
        
        var body: some View{
            PricingPerDayStepperView(value: $value)
        }
    }
    static var previews: some View {
        Preview()
            .padding()
    }
}
