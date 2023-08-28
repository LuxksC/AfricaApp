//
//  GalleryViewModel.swift
//  Africa
//
//  Created by Lucas de Castro Souza on 28/08/23.
//

import Foundation

class GalleryViewModel: ObservableObject {
    
    // MARK: - Published Variables
    @Published private(set) var animals: [Animal] = []
    @Published private(set) var isLoading: Bool = true
    @Published private(set) var errorMessage: String?
    
    // MARK: - UseCases
    private let galleryUseCase: GalleryUseCaseProtocol
    
    private let dispatchGroup = DispatchGroup()

    // MARK: - Initializer
    init(
        galleryUseCase: GalleryUseCaseProtocol = GalleryUseCase()
    ) {
        self.galleryUseCase = galleryUseCase
        
        loadData()
    }
    
    // MARK: - Methods
    func loadData() {
        isLoading = true
        
        getAnimals()
        
        dispatchGroup.notify(queue: .main) { [weak self] in
            guard let self else { return }
            
            self.isLoading = false
        }
    }
    
    // MARK: - Private Methods
    private func getAnimals() {
        dispatchGroup.enter()
        
        galleryUseCase.getAnimals { [weak self] response in
            guard let self else { return }
            
            switch response {
            case .success(let response):
                self.animals = response
            case .failure(let message):
                self.errorMessage = message
            }
            
            self.dispatchGroup.leave()
        }
    }


}
