//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Lucas de Castro Souza on 25/08/23.
//

import Foundation
import AVKit

var player: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer? {
    if let videoURL = Bundle.main.url(forResource: fileName, withExtension: fileFormat) {
        player = AVPlayer(url: videoURL)
        player?.play()
    }
    return player
}
