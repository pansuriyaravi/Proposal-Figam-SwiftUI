////
//  EmptyImageView.swift
//  bug-free-goggles
//
//  Created by Mac on 31/05/23.
//

import SwiftUI

struct EmptyImageView: View {
    var fromText: String = " from gallery or camera"
    
    var body: some View {
        VStack(spacing: 4) {
            Image("addIcon")
            Text("Add Images")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.gray700)
                .padding(.top, 12)
            
            Group {
                Text("Browse Files")
                    .foregroundColor(.darkIndigo)
                    .font(.system(size: 14, weight: .medium))
                + Text(fromText)
                    .foregroundColor(.darkGray)
                    .font(.system(size: 14, weight: .regular))
            }
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: 156)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color.darkGray, style: StrokeStyle(lineWidth: 1, dash: [10]))
        )
        
    }
}

struct EmptyImageButton: View {
    let action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            EmptyImageView()
        }
    }
}


struct EmptyImageView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyImageView()
    }
}
