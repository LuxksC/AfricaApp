//
//  BrowseViewModel.swift
//  Africa
//
//  Created by Lucas de Castro Souza on 14/08/23.
//

import Foundation

class BrowseViewModel: ObservableObject {
    
    @Published private(set) var covers: [Cover] = []
    @Published private(set) var animals: [Animal] = []
    @Published private(set) var isLoading: Bool = true
    @Published private(set) var errorMessage: String?
    
    private var browseUseCase: BrowseUseCaseProtocol
    
    private let dispatchGroup = DispatchGroup()
    
    init(
        browseUseCase: BrowseUseCaseProtocol = BrowseUseCase()
    ) {
        self.browseUseCase = browseUseCase
        
        loadData()
    }
    
    func loadData() {
        isLoading = true
        
        getCovers()
        getAnimals()
        
        dispatchGroup.notify(queue: .main) { [weak self] in
            guard let self else { return }
            
            self.isLoading = false
        }
    }
    
    private func getCovers() {
        dispatchGroup.enter()
        
        browseUseCase.getCovers { [weak self] response in
            guard let self else { return }
            
            switch response {
            case .success(let response):
                self.covers = response
            case .failure(let message):
                self.errorMessage = message
            }
            
            self.dispatchGroup.leave()
        }
    }
    
    private func getAnimals() {
        dispatchGroup.enter()
        
        browseUseCase.getAnimals { [weak self] response in
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
