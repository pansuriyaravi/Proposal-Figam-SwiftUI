////
//  CircleButton.swift
//  bug-free-goggles
//
//  Created by Mac on 01/06/23.
//

import SwiftUI

struct CircleButton<Icon: View>: View {
    var size: CGFloat = 16
    var backgroundColor: Color = Color.black
    @ViewBuilder let icon: Icon
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack{
                Circle()
                    .fill(backgroundColor)
                icon
            }
            .frame(width: size, height: size)
            .contentShape(Circle())
        }
        .buttonStyle(.plain)
    }
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleButton(size: 56, backgroundColor: .secondaryLightGray) {
            IconView(image: "plus_icon", size: 24)
        } action: {
            
        }

    }
}
