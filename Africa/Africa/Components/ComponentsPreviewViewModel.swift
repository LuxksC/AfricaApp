//
//  ComponentsPreviewViewModel.swift
//  Africa
//
//  Created by Lucas de Castro Souza on 14/08/23.
//

import Foundation

class ComponentsPreviewViewModel: ObservableObject {
    @Published private(set) var covers: [Cover] = []
    
    private var browseUseCase: BrowseUseCaseProtocol
    
    init(
        browseUseCase: BrowseUseCaseProtocol = BrowseUseCase()
    ) {
        self.browseUseCase = browseUseCase
    }
    
    func loadCovers() {
        browseUseCase.getCovers { response in
            switch response {
            case .success(let response):
                self.covers = response
            case .failure(let message):
                print(message ?? "")
            }
        }
    }
}
