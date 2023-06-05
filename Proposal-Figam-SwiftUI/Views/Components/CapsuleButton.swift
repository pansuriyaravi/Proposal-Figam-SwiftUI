////
//  CapsuleButton.swift
//  bug-free-goggles
//
//  Created by Mac on 31/05/23.
//

import SwiftUI

struct CapsuleButton: View {
    let title: String
    var horizontalPadding: CGFloat = 16
    var verticalPadding: CGFloat = 16
    var maxWidth: Bool = false
    var foregroundColor: Color = Color.black
    var backgroundColor: Color = Color.clear
    var font: Font = .inter(size: 15, weight: .semibold)
    let action: () -> Void
    
    private let shape = Capsule()
    
    var body: some View {
        Button(action: action) {
            Text(title)
            .font(font)
            .foregroundColor(foregroundColor)
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .frame(maxWidth: maxWidth ? .infinity : nil)
            .background(
                shape
                    .fill(backgroundColor)
            )
            .contentShape(shape)
        }
        .buttonStyle(.plain)
    }
}

struct CapsuleButton_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleButton(
            title: "Hour",
            horizontalPadding: 16,
            verticalPadding: 9,
            foregroundColor: .white,
            backgroundColor: .blue,
            action: {}
        )
        
        CapsuleButton(
            title: "Hour",
            horizontalPadding: 16,
            verticalPadding: 9,
            maxWidth: true,
            foregroundColor: .white,
            backgroundColor: .blue,
            action: {}
        )
    }
}
