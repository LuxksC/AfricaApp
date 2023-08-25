//
//  HeadingView.swift
//  Africa
//
//  Created by Lucas de Castro Souza on 21/08/23.
//

import SwiftUI

struct HeadingView: View {
    var image: String
    var title: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.primary)
        }
        .padding(.vertical)
    }
}

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(image: "photo.on.rectangle.angled", title: "Wilderness in Pictures")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
