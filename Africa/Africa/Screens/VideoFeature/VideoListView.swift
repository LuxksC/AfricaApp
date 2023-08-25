//
//  VideoListView.swift
//  Africa
//
//  Created by Lucas de Castro Souza on 11/08/23.
//

import SwiftUI

struct VideoListView: View {
    @StateObject var viewModel: VideoListViewModel = VideoListViewModel()
    
    var body: some View {
        if viewModel.isLoading {
            LoaderView()
        } else if let error = viewModel.errorMessage, !viewModel.isLoading {
            ErrorView(message: error) { viewModel.loadData() }
        } else {
            contentView
        }
//        contentView
    }
    
    var contentView: some View {
        NavigationView {
            List {
                ForEach(viewModel.videos) { video in
                    VideoListItemView(video: video)
                        .padding(.vertical, 8)
                        .alignmentGuide(.listRowSeparatorLeading) { _ in
                            -16
                        }
                }
            }
        }
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
