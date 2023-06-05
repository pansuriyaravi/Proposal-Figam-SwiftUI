////
//  BorderedCapsuleButton.swift
//  bug-free-goggles
//
//  Created by Mac on 31/05/23.
//

import SwiftUI

struct BorderedCapsuleButton: View {
    var leadingImage: String? = nil
    let title: String
    var trailingImage: String? = nil
    var spacing: CGFloat = 16
    var horizontalPadding: CGFloat = 16
    var verticalPadding: CGFloat = 16
    var maxWidth: CGFloat? = nil
    var foregroundColor: Color = Color.black
    var borderColor: Color = Color.black
    var lineWidth: CGFloat = 1
    let action: () -> Void
    
    private let shape = Capsule()
    
    var body: some View {
        Button(action: action) {
            ZStack{
                HStack(spacing: spacing) {
                    if let leadingImage = leadingImage{
                        Icon(image: leadingImage)
                    }
                    Text(title)
                    if let trailingImage = trailingImage {
                        Icon(image: trailingImage)
                    }
                }
                .foregroundColor(foregroundColor)
                .padding(.horizontal, horizontalPadding)
                .padding(.vertical, verticalPadding)
                .frame(maxWidth: maxWidth)
                .background(
                    shape
                        .strokeBorder(lineWidth: lineWidth)
                        .foregroundColor(borderColor)
                )
                .contentShape(shape)
            }
        }
    }
    
    private struct Icon: View{
        let image: String
        var body: some View{
            Image(image)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
        }
    }
}

struct BorderedCapsuleButton_Previews: PreviewProvider {
    static var previews: some View {
        BorderedCapsuleButton(
            title: "06/13/2023 - 08/13/2023",
            action: {}
        )
        
        BorderedCapsuleButton(
            title: "06/13/2023 - 08/13/2023",
            maxWidth: .infinity,
            action: {}
        )
    }
}
