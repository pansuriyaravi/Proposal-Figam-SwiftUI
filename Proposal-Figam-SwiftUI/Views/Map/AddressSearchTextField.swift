//
//  PlaceSearchView.swift
//  cheffy
//
//  Created by Viswanath Reddy on 07/05/23.
//

import SwiftUI

struct AddressSearchTextField: View {
    @EnvironmentObject var addressSearchVM: AddressSearchViewModel
    @FocusState private var isFocusedTextField: Bool
    var placeholder: String = "enter location"
    
    var body: some View {
        HStack {
            Image("location_on")
            TextField(placeholder, text: $addressSearchVM.searchableText)
                .disableAutocorrection(true)
                .foregroundColor(Color.primary)
                .focused($isFocusedTextField)
                .placeholder(placeholder, when: addressSearchVM.searchableText.isEmpty)
                .font(.body)
                .onReceive(
                    addressSearchVM.$searchableText.debounce(
                        for: .seconds(1),
                        scheduler: DispatchQueue.main
                    )
                ) {
                    addressSearchVM.searchAddress($0)
                }
                .overlay {
                    ZStack(alignment: .trailing){
                        if !addressSearchVM.searchableText.isEmpty {
                            Button {
                                addressSearchVM.clear()
                            } label: {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(Color.secondaryGray)
                            }
                            .foregroundColor(.secondary)
                        }
                    }
                    .padding(.trailing)
                    .padding(.top, 5)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .onAppear {
                    isFocusedTextField = true
                }
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            maxHeight: 40,
            alignment: .leading
        )
        .padding(10)
        .background(Capsule().fill(Color.secondaryLightGray))
    }
}

struct PlaceSearchView_Previews: PreviewProvider {
    static var previews: some View {
        AddressSearchTextField()
            .environmentObject(AddressSearchViewModel())
            .previewLayout(.sizeThatFits)
    }
}
