////
//  RoomDescriptionSelectionView.swift
//  bug-free-goggles
//
//  Created by Mac on 02/06/23.
//

import SwiftUI

struct RoomDescriptionSelectionView: View {
    let descriptions: [RoomDescription]
    @Binding var selection: Set<RoomDescription>
    var horizontalPadding: CGFloat = 16
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(descriptions, id: \.self) { description in
                    let isSelected = selection.contains(description)
                    OptionButton(
                        imageName: description.imageName,
                        title: description.name,
                        isSelected: isSelected,
                        action: {
                            onSelect(description: description, isSelected: isSelected)
                        }
                    )
                    .font(.system(size: 17, weight: .semibold))
                }
            }
            .padding(.horizontal, horizontalPadding)
        }
    }
    
    func onSelect(description: RoomDescription, isSelected: Bool){
        if isSelected{
            selection.remove(description)
        }
        else{
            selection = selection.union([description])
        }
    }
}

struct RoomDescriptionSelectionView_Previews: PreviewProvider {
    private struct Preview: View{
        @State var selection: Set<RoomDescription> = []
        
        var body: some View{
            RoomDescriptionSelectionView(
                descriptions: .basic,
                selection: $selection
            )
        }
    }
    static var previews: some View {
        Preview()
    }
}
