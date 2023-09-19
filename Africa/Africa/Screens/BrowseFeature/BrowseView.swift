//
//  BrowseView.swift
//  Africa
//
//  Created by Lucas de Castro Souza on 11/08/23.
//

import SwiftUI
import SkeletonUI

struct BrowseView: View {
    // MARK: - Properties

    @StateObject var viewModel: BrowseViewModel = BrowseViewModel()
    
    @State private var isGridViewActive: Bool = false
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var numberOfColumns: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    // MARK: - Body

    var body: some View {
        if viewModel.isLoading {
            LoaderView()
        } else if let error = viewModel.errorMessage, !viewModel.isLoading {
            ErrorView(message: error) { viewModel.loadData() }
        } else {
            contentView
        }
    }
    
    // MARK: - Content

    private var contentView: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
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
                        
                        CreditsView()
                            .modifier(CenterModifier())
                    }
                    .listStyle(.plain)
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center) {
                            ForEach(viewModel.animals) { animal in
                                NavigationLink(
                                    destination: { AnimalDetailView(animal: animal) },
                                    label: {
                                        AnimalGridItemView(animal: animal)
                                    }
                                )
                            }
                        }
                        .padding(10)
                        .animation(.easeIn)
                    }
                }
            }
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button(action: {
                            print("activate list view")
                            isGridViewActive = false
                        }) {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        Button(action: {
                            print("activate grid view")
                            isGridViewActive = true
                            gridSwitch()
                        }) {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - Private Methods

    private func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: (gridLayout.count % 3 + 1))
        numberOfColumns = gridLayout.count
        
        switch numberOfColumns {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }

}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
    }
}
