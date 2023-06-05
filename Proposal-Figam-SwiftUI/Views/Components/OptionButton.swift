////
//  OptionButton.swift
//  bug-free-goggles
//
//  Created by Mac on 01/06/23.
//

import SwiftUI

struct OptionButton: View{
    let imageName: String
    let title: String
    let isSelected: Bool
    var font: Font = .system(size: 17, weight: .semibold)
    let action: () -> Void
    
    private var forgroundColor: Color{
        return isSelected ? .white : .black
    }
    
    var body: some View{
        Button(action: action) {
            HStack(spacing: 8) {
                IconView(
                    image: imageName,
                    size: 24,
                    forgroundColor: forgroundColor
                )
                
                Text(title)
                    .font(font)
            }
            .foregroundColor(forgroundColor)
            .padding(.horizontal, 32)
            .padding(.vertical, 14)
            .background(
                Capsule()
                    .fill(isSelected ? Color.appPrimary : Color.secondaryLightGray)
            )
            .contentShape(Capsule())
        }
        .buttonStyle(.plain)
    }
}

struct OptionButton_Previews: PreviewProvider {
    static var previews: some View {
        OptionButton(imageName: "time", title: "Time", isSelected: false, action: {})
    }
}
