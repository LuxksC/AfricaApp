//
//  CoverImageView.swift
//  Africa
//
//  Created by Lucas de Castro Souza on 11/08/23.
//

import SwiftUI

struct CoverImageView: View {
    var covers: [Cover]
    
    var body: some View {
        TabView {
            ForEach(covers) { cover in
                Image(cover.name)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct CoverImageView_Previews: PreviewProvider {
    static var covers = ModelSamples.covers
    
    static var previews: some View {
        CoverImageView(covers: covers)
            .frame(width: 220, height: 180)
            .previewLayout(.sizeThatFits)
    }
}
