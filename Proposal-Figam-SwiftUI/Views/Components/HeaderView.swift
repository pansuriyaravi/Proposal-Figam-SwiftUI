//
//  AddressTopView.swift
//  cheffy
//
//  Created by Viswanath Reddy on 08/05/23.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.system(size: 28, weight: .bold))
                .fixedSize(horizontal: false, vertical: true)
            
            Text(subtitle)
                .tracking(0.5)
                .font(.system(size: 15, weight: .regular))
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

struct AddressTopView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(
            title: "Title",
            subtitle: "Sub Title"
        ).previewLayout(.sizeThatFits)
    }
}
