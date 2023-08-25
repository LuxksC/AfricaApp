//
//  MockResponse.swift
//  Africa
//
//  Created by Lucas de Castro Souza on 11/08/23.
//

enum MockResponse<T: Codable> {
    case success(response: T)
    case failure(message: String?)
}
