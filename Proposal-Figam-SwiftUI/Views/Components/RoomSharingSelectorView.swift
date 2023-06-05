////
//  RoomSharingSelectorView.swift
//  bug-free-goggles
//
//  Created by Mac on 01/06/23.
//

import SwiftUI

enum RoomSharingOption: String, CaseIterable{
    case onlyMe = "Only Me"
    case multiplePersons = "Multiple Persons"
    
    var imageName: String{
        switch self{
        case .onlyMe:
            return "person"
        case .multiplePersons:
            return "persongroup"
        }
    }
    
    var name: String{
        return rawValue
    }
}

struct RoomSharingSelectorView: View {
    @Binding var option: RoomSharingOption?
    var options: [RoomSharingOption] = RoomSharingOption.allCases
    var spacing: CGFloat = 16
    var horizontalPadding: CGFloat = 16
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: spacing) {
                ForEach(options, id: \.self) { item in
                    let isSelected = item == option
                    OptionButton(
                        imageName: item.imageName,
                        title: item.name,
                        isSelected: isSelected
                    ) {
                        onSelection(item: item)
                    }
                }
            }
            .padding(.horizontal, horizontalPadding)
        }
    }
    
    func onSelection(item: RoomSharingOption?){
        if option == item{
            option = .none
        }
        else {
            option = item
        }
    }
}

struct RoomSharingSelectorView_Previews: PreviewProvider {
    private struct Preview: View{
        @State var option: RoomSharingOption? = .none
        var body: some View{
            RoomSharingSelectorView(option: $option)
        }
    }
    static var previews: some View {
        Preview()
    }
}
