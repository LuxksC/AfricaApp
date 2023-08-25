//
//  VideoListItemView.swift
//  Africa
//
//  Created by Lucas de Castro Souza on 22/08/23.
//

import SwiftUI

struct VideoListItemView: View {
    var video: Video
    
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .cornerRadius(8)
                    .overlay() {
                        Color.black
                        .opacity(0.1)
                    }
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                
            }
        }
    }
}

struct VideoListItemView_Previews: PreviewProvider {
    static var video: Video = ModelSamples.video
    
    static var previews: some View {
        VideoListItemView(video: video)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
