//
//  LocationUseCase.swift
//  Africa
//
//  Created by Lucas de Castro Souza on 25/08/23.
//

import Foundation

protocol LocationUseCaseProtocol {
    func getLocations(completionHandler: @escaping (MockResponse<[ParkLocation]>) -> Void)
}

final class LocationUseCase: LocationUseCaseProtocol {
    func getLocations(completionHandler: @escaping (MockResponse<[ParkLocation]>) -> Void) {
        Bundle.main.decode("locations.json", completionHandler: completionHandler)
    }
}
