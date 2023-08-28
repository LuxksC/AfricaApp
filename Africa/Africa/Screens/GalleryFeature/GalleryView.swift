//
//  GalleryView.swift
//  Africa
//
//  Created by Lucas de Castro Souza on 11/08/23.
//

import SwiftUI

struct GalleryView: View {
    @State private var selectedAnimal: String = "lion"
    @StateObject var viewModel: GalleryViewModel = GalleryViewModel()

    // STATIC GRID DEFINITION
//    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    // DYNAMIC GRID DEFINITION
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var numberOfColumns: Double = 3.0
    
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
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
    
    private var contentView: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                // MARK: - Image

                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                
                // MARK: - Slider
                Slider(value: $numberOfColumns, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: numberOfColumns) { value in
                        gridSwitch()
                    }
                
                
                // MARK: - Grid
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(viewModel.animals) { animal in
                        Image(animal.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().strokeBorder(Color.white, lineWidth: 2))
                            .onTapGesture {
                                selectedAnimal = animal.image
                                hapticImpact.impactOccurred()
                            }
                    }
                }
                .onAppear {
                    gridSwitch()
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
    
    private func gridSwitch() {
        gridLayout = Array(repeating: GridItem(.flexible()), count: Int(numberOfColumns))
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
