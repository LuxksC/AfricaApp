//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Lucas de Castro Souza on 25/08/23.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    var fileName: String
    var videoTitle: String
    
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: fileName, fileFormat: "mp4"))
                .overlay(alignment: .topLeading) {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .padding(.top, 6)
                        .padding(.horizontal, 8)
            }
        }
        .navigationTitle(videoTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(fileName: "cheetah", videoTitle: "Cheetah")
        }
    }
}
