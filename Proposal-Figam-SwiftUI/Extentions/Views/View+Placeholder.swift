//
//  View+Placeholder.swift
//  Proposal-Figam-SwiftUI
//
//  Created by mac on 05/06/23.
//

import SwiftUI

extension View {
    func getScreenBounds() -> CGRect {
        return UIScreen.main.bounds
    }
    
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
    
    func placeholder(
        _ text: String,
        when shouldShow: Bool,
        alignment: Alignment = .leading) -> some View {
            
        placeholder(when: shouldShow, alignment: alignment) { Text(text).foregroundColor(.primary) }
    }
}
