////
//  Font+Inter.swift
//  bug-free-goggles
//
//  Created by Mac on 01/06/23.
//

import SwiftUI

extension Font.Weight{
    /// Represents the available font weights for Inter font.
    enum Inter: String {
        /// Weight: 900
        case black = "Inter-Regular_Black"
        
        /// Weight: 800
        case heavy = "Inter-Regular_ExtraBold"
        
        /// Weight: 700
        case bold = "Inter-Regular_Bold"

        /// Weight: 600
        case semibold = "Inter-Regular_SemiBold"
        
        /// Weight: 500
        case medium = "Inter-Regular_Medium"

        /// Weight: 400
        case regular = "Inter-Regular"

        /// Weight: 300
        case light = "Inter-Regular_Light"
        
        /// Weight: 200
        case thin = "Inter-Regular_ExtraLight"
        
        /// Weight: 100
        case ultraLight = "Inter-Regular_Thin"
        
        var name: String{
            return rawValue
        }
    }
}

extension Font{
    /// Creates a custom Inter font with the specified size and weight.
    /// - Parameters:
    ///   - size: The size of the font.
    ///   - weight: The weight of the font. The default value is `.regular`.
    /// - Returns: A custom `Font` object with the specified size and weight, using the Inter font family.
    /// - Note: The Inter font family must be available in the project for this function to work correctly.
    static func inter(size: CGFloat, weight: Font.Weight.Inter = .regular) -> Font{
        return Font.custom(weight.name, size: size)
    }
}
