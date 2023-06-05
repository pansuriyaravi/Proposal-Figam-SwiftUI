////
//  AmenitiesSelectionView.swift
//  bug-free-goggles
//
//  Created by Mac on 01/06/23.
//

import SwiftUI

struct AmenitiesSelectionView: View {
    let amenities: [Amenity]
    @Binding var selection: Set<Amenity>
    var horizontalPadding: CGFloat = 16
    
    var body: some View {
        WrappingHStack(
            amenities,
            spacing: .constant(8),
            lineSpacing: 8,
            horizontalSpacing: horizontalPadding,
            isScollable: true
        ) { amenity in
            let isSelected = selection.contains(amenity)
            OptionButton(
                imageName: amenity.imageName,
                title: amenity.name,
                isSelected: isSelected,
                action: {
                    onSelect(amenity: amenity, isSelected: isSelected)
                }
            )
        }
    }
    
    func onSelect(amenity: Amenity, isSelected: Bool){
        if isSelected{
            selection.remove(amenity)
        }
        else{
            selection = selection.union([amenity])
        }
    }
}

struct AmenitiesSelectionView_Previews: PreviewProvider {
    private struct Preview: View{
        @State var selection: Set<Amenity> = []
        
        var body: some View{
            AmenitiesSelectionView(
                amenities: .standout,
                selection: $selection
            )
        }
    }
    static var previews: some View {
        Preview()
    }
}
