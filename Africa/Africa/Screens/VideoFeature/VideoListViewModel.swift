//
//  VideoListViewModel.swift
//  Africa
//
//  Created by Lucas de Castro Souza on 22/08/23.
//

import Foundation

class VideoListViewModel: ObservableObject {
    
    // MARK: - Published Variables
    @Published private(set) var videos: [Video] = []
    @Published private(set) var isLoading: Bool = true
    @Published private(set) var errorMessage: String?
    
    // MARK: - UseCases
    private let videoUseCase: VideoUseCaseProtocol
    
    private let dispatchGroup = DispatchGroup()

    // MARK: - Initializer
    init(
        videoUseCase: VideoUseCaseProtocol = VideoUseCase()
    ) {
        self.videoUseCase = videoUseCase
        
        loadData()
    }
    
    // MARK: - Methods
    func loadData() {
        isLoading = true
        
        getVideos()
        
        dispatchGroup.notify(queue: .main) { [weak self] in
            guard let self else { return }
            
            self.isLoading = false
        }
    }
    
    // MARK: - Private Methods
    private func getVideos() {
        dispatchGroup.enter()
        
        videoUseCase.getVideos { [weak self] response in
            guard let self else { return }
            
            switch response {
            case .success(let response):
                self.videos = response
            case .failure(let message):
                self.errorMessage = message
            }
            
            self.dispatchGroup.leave()
        }
    }


}
