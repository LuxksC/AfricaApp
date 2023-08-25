//
//  AnimalModel.swift
//  Africa
//
//  Created by Lucas de Castro Souza on 16/08/23.
//

import Foundation

struct Animal: Codable, Identifiable {
    let id, name, headline: String
    let description, link, image: String
    let gallery, fact: [String]
}
