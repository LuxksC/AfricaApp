//
//  MapViewModel.swift
//  Africa
//
//  Created by Lucas de Castro Souza on 24/08/23.
//

import Foundation

class MapViewModel: ObservableObject {
    
    // MARK: - Published Variables
    @Published private(set) var locations: [ParkLocation] = []
    @Published private(set) var isLoading: Bool = true
    @Published private(set) var errorMessage: String?
    
    // MARK: - UseCases
    private let locationUseCase: LocationUseCaseProtocol
    
    private let dispatchGroup = DispatchGroup()

    // MARK: - Initializer
    init(
        locationUseCase: LocationUseCaseProtocol = LocationUseCase()
    ) {
        self.locationUseCase = locationUseCase
        
        loadData()
    }
    
    // MARK: - Methods
    func loadData() {
        isLoading = true
        
        getLocations()
        
        dispatchGroup.notify(queue: .main) { [weak self] in
            guard let self else { return }
            
            self.isLoading = false
        }
    }

    // MARK: - Private Methods
    private func getLocations() {
        dispatchGroup.enter()
        
        locationUseCase.getLocations { [weak self] response in
            guard let self else { return }
            
            switch response {
            case .success(let response):
                self.locations = response
            case .failure(let message):
                self.errorMessage = message
            }
            
            self.dispatchGroup.leave()
        }
    }


}
