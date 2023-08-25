//
//  BrowseUseCase.swift
//  Africa
//
//  Created by Lucas de Castro Souza on 11/08/23.
//

import Foundation

protocol BrowseUseCaseProtocol {
    func getCovers(completionHandler: @escaping (MockResponse<[Cover]>) -> Void)
    func getAnimals(completionHandler: @escaping (MockResponse<[Animal]>) -> Void)
}

final class BrowseUseCase: BrowseUseCaseProtocol {
    func getCovers(completionHandler: @escaping (MockResponse<[Cover]>) -> Void) {
        Bundle.main.decode("covers.json", completionHandler: completionHandler)
    }
    
    func getAnimals(completionHandler: @escaping (MockResponse<[Animal]>) -> Void) {
        Bundle.main.decode("animals.json", completionHandler: completionHandler)
    }
}
