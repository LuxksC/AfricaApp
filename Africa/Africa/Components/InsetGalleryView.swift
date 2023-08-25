//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Lucas de Castro Souza on 21/08/23.
//

import SwiftUI

struct InsetGalleryView: View {
    var images: [String]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(images, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                }
            }
        }
    }
}

struct InsetGalleryView_Previews: PreviewProvider {
    static var animal = ModelSamples.animal
    
    static var previews: some View {
        InsetGalleryView(images: animal.gallery)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
