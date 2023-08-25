//
//  VideoListView.swift
//  Africa
//
//  Created by Lucas de Castro Souza on 11/08/23.
//

import SwiftUI

struct VideoListView: View {
    @StateObject var viewModel: VideoListViewModel = VideoListViewModel()
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        if viewModel.isLoading {
            LoaderView()
        } else if let error = viewModel.errorMessage, !viewModel.isLoading {
            ErrorView(message: error) { viewModel.loadData() }
        } else {
            contentView
        }
    }
    
    var contentView: some View {
        NavigationView {
            List {
                ForEach(viewModel.videos) { video in
                    NavigationLink(destination: VideoPlayerView(fileName: video.id, videoTitle: video.name)) {
                        VideoListItemView(video: video)
                            .padding(.vertical, 8)
                            .alignmentGuide(.listRowSeparatorLeading) { _ in
                                -16
                        }
                    }
                }
            }
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(
                        action: {
                            viewModel.shuffleVideos()
                            hapticImpact.impactOccurred()
                        },
                        label: {
                            Image(systemName: "arrow.2.squarepath")
                                .foregroundColor(.accentColor)
                        }
                    )
                }
            }
        }
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoListView()
        }
    }
}
