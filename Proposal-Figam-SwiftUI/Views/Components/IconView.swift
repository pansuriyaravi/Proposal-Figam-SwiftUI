////
//  IconView.swift
//  bug-free-goggles
//
//  Created by Mac on 31/05/23.
//

import SwiftUI

struct IconView: View {
    let image: String
    var size: CGFloat = 16
    var forgroundColor: Color? = nil
    var body: some View {
        Group {
            if let forgroundColor = forgroundColor {
                Image(image)
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size, height: size)
                    .foregroundColor(forgroundColor)
            }
            else{
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size, height: size)
            }
        }
    }
}

struct IconView_Previews: PreviewProvider {
    static var previews: some View {
        IconView(image: "time")
    }
}
