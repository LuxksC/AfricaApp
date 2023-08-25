//
//  VideoUseCase.swift
//  Africa
//
//  Created by Lucas de Castro Souza on 22/08/23.
//

import Foundation

protocol VideoUseCaseProtocol {
    func getVideos(completionHandler: @escaping (MockResponse<[Video]>) -> Void)
}

final class VideoUseCase: VideoUseCaseProtocol {
    func getVideos(completionHandler: @escaping (MockResponse<[Video]>) -> Void) {
        Bundle.main.decode("videos.json", completionHandler: completionHandler)
    }
}
