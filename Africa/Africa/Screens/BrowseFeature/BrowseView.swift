//
//  BrowseView.swift
//  Africa
//
//  Created by Lucas de Castro Souza on 11/08/23.
//

import SwiftUI
import SkeletonUI

struct BrowseView: View {
    @StateObject var viewModel: BrowseViewModel = BrowseViewModel()
    
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
                CoverImageView(covers: viewModel.covers)
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .padding(.bottom, 8)
                
                ForEach(viewModel.animals) { animal in
                    NavigationLink(
                        destination: { AnimalDetailView(animal: animal) },
                        label: {
                            AnimalsListRowView(animal: animal)
                        }
                    )
                }
            }
            .listStyle(.plain)
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
    }
}
