////
//  FieldView.swift
//  bug-free-goggles
//
//  Created by Mac on 01/06/23.
//

import SwiftUI

struct FieldView<Content: View>: View{
    let label: String
    @ViewBuilder let content: Content
    
    var body: some View{
        VStack(alignment: .leading, spacing: 12) {
            Text(label)
                .foregroundColor(.secondaryGray)
                .font(.system(size: 13, weight: .bold))
            content
        }
    }
}

struct FieldView_Previews: PreviewProvider {
    static var previews: some View {
        FieldView(label: "Date") {
            BorderedCapsuleButton(
                title: "06/13/2023 - 08/13/2023 ",
                trailingImage: "calendar",
                spacing: 16,
                horizontalPadding: 20,
                verticalPadding: 12,
                borderColor: .neutral700,
                action: {
                    // TODO: add date picker
                }
            )
            .font(.inter(size: 15, weight: .medium))
        }
    }
}
