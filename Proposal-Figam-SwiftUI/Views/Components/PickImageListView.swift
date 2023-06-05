////
//  PickImageListView.swift
//  bug-free-goggles
//
//  Created by Mac on 01/06/23.
//

import SwiftUI
import PhotosUI

struct PickImageListView: View {
    @State private var selectedItems = [PhotosPickerItem]()
    @Binding var selectedImages: [Image]
    @State var gridLayout: [GridItem] = [GridItem()]
    
    var body: some View {
        VStack(spacing: 12) {
            PhotosPicker(selection: $selectedItems, matching: .images) {
                EmptyImageView(fromText: " from gallery")
            }
           
            LazyVGrid(columns: gridLayout, spacing: 12) {
                ForEach(0..<selectedImages.count, id: \.self) { i in
                    ImageView(image: selectedImages[i]) {
                        selectedImages.remove(at: i)
                    }
                }
            }
        }
        .onChange(of: selectedItems) { _ in
            Task {
                selectedImages.removeAll()
                for item in selectedItems {
                    if let data = try? await item.loadTransferable(type: Data.self) {
                        if let uiImage = UIImage(data: data) {
                            let image = Image(uiImage: uiImage)
                            selectedImages.append(image)
                        }
                    }
                }
            }
        }
    }
}

struct PickImageListView_Previews: PreviewProvider {
    static var previews: some View {
        PickImageListView(selectedImages: .constant([]))
    }
}
