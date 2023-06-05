//
//  AddressAnnotationView.swift
//  cheffy
//
//  Created by Viswanath Reddy on 08/05/23.
//

import SwiftUI

struct AddressAnnotationView: View {
    @State private var isTitle = true
    let title: String
    
    var body: some View {
        VStack(spacing: 0) {
            Text(title)
                .lineLimit(nil)
                .font(.callout)
                .padding(5)
                .background(Color(.white))
                .cornerRadius(10)
                .opacity(isTitle ? 0 : 1)
            
            Image(systemName: "mappin.circle.fill")
                .font(.title)
                .foregroundColor(.red)
            
            Image(systemName: "arrowtriangle.down.fill")
                .font(.caption)
                .foregroundColor(.red)
                .offset(x: 0, y: -5)
        }
        .animation(.easeInOut, value: isTitle)
        .onTapGesture {
            isTitle.toggle()
        }
    }
}

struct PlaceAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        AddressAnnotationView(title: "Place")
    }
}
