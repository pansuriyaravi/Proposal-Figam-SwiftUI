////
//  BorderedCircleButton.swift
//  bug-free-goggles
//
//  Created by Mac on 31/05/23.
//

import SwiftUI

struct BorderedCircleButton<Icon: View>: View {
    var size: CGFloat = 16
    var borderColor: Color = Color.black
    var lineWidth: CGFloat = 1
    @ViewBuilder let icon: Icon
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack{
                Circle()
                    .strokeBorder(lineWidth: lineWidth)
                    .foregroundColor(borderColor)
                icon
            }
            .frame(width: size, height: size)
            .contentShape(Circle())
        }
        .buttonStyle(.plain)
    }
}

struct BorderedCircleButton_Previews: PreviewProvider {
    static var previews: some View {
        BorderedCircleButton(size: 16 * 2) {
            IconView(image: "time")
        } action: {
            
        }
    }
}
