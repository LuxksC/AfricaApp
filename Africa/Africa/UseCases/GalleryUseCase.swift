//
//  GalleryUseCase.swift
//  Africa
//
//  Created by Lucas de Castro Souza on 28/08/23.
//

import Foundation

protocol GalleryUseCaseProtocol {
    func getAnimals(completionHandler: @escaping (MockResponse<[Animal]>) -> Void)
}

final class GalleryUseCase: GalleryUseCaseProtocol {
    func getAnimals(completionHandler: @escaping (MockResponse<[Animal]>) -> Void) {
        Bundle.main.decode("animals.json", completionHandler: completionHandler)
    }
}
