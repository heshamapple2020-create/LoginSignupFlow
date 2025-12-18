//
//  Your Photo.swift
//  LoginSignupFlow
//
//  Created by Mahmoud Emad on 17/12/2025.
//

import SwiftUI
import PhotosUI

struct Your_Photo: View {
    
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedImage: UIImage?
    @State private var isLoadingImage = false
    
    var body: some View {
        PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
            Group{
                if let uiImage = selectedImage {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                } else if isLoadingImage {
                    ProgressView()
                        .frame(height: 250)
                        .frame(maxWidth: .infinity)
                        .background(Color(white: 0.4, opacity: 0.32))
                } else {
                    Image(systemName: "photo.badge.plus.fill")
                        .font(.largeTitle)
                        .frame(height: 250)
                        .frame(maxWidth: .infinity)
                        .background(Color(white: 0.4, opacity: 0.32))
                }
                
            }
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .onChange(of: selectedItem) { oldValue, newValue in
            guard let newValue else { return }
            isLoadingImage = true
            Task {
                defer { isLoadingImage = false }
                if let data = try? await newValue.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    selectedImage = uiImage
                } else {
                    // Fallback: try loading as a CGImage via ImageDecoder if available in future, otherwise clear selection
                    selectedImage = nil
                }
            }
        }
    }
}

#Preview {
    Your_Photo()
}
