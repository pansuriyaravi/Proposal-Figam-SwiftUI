////
//  ImageView.swift
//  bug-free-goggles
//
//  Created by Mac on 12/05/23.
//

import SwiftUI

struct ImageView: View {
    var image:Image
    var clicked: () -> Void
    
    var body: some View {
        image
            .resizable()
            .scaledToFill()
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(maxHeight: 200)
            .shadow(color: Color.primary.opacity(0.3), radius: 1)
            .overlay(
                ZStack(alignment: .topTrailing) {
                    Color.black.opacity(0.2)
                    Button(action: clicked, label: {
                        Image("close")
                            .font(.system(.title))
                    })
                    .padding([.top, .trailing], 10)
                }
                ,alignment: .topTrailing
            )
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.neutral700, style: StrokeStyle(lineWidth: 2))
            }
            .cornerRadius(12)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        
        ImageView(image: Image("hotel1"), clicked: {
            print("Clicked close button")
        })
    }
}
