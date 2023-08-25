//
//  VideoModel.swift
//  Africa
//
//  Created by Lucas de Castro Souza on 22/08/23.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String {
        "video-\(id)"
    }
}
