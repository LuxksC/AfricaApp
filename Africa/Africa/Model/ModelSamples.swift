//
//  ModelSamples.swift
//  Africa
//
//  Created by Lucas de Castro Souza on 22/08/23.
//

import Foundation

/// Struct with samples from all project models
struct ModelSamples {
    // MARK: - Animal

    static var animal: Animal = Animal(
        id: "lion",
        name: "Lion",
        headline: "The world's most social felines, lions roam the savannas and grasslands of the African continent, hunting cooperatively and raising cubs in prides. ",
        description: "The lion (Panthera leo) is a species in the family Felidae and a member of the genus Panthera. It is most recognisable for its muscular, deep-chested body, short, rounded head, round ears, and a hairy tuft at the end of its tail.",
        link: "https://en.wikipedia.org/wiki/Lion",
        image: "lion",
        gallery: [
            "lion-1",
            "lion-2",
            "lion-3",
            "lion-4"
          ],
        fact: [
            "Female lions raise the cubs and are also the primary hunters.",
            "Lions are the only cats that live in groups. A pride, can be up to 30 lions, depending on how much food and water is available.",
            "Without their coats, lion and tiger bodies are so similar that only experts can tell them apart."
          ]
    )
    
    // MARK: - Cover / Covers

    static var cover: Cover = Cover(
        id: 1,
        name: "cover-lion"
    )
    
    static var covers: [Cover] = [
        Cover(id: 1, name: "cover-lion"),
        Cover(id: 2, name: "cover-elephant")
    ]
    
    // MARK: - Video / Videos

    static var video: Video = Video(
        id: "cheetah",
        name: "Cheetah",
        headline: "Cheetah walking in the savannah"
    )
    
    static var videos: [Video] = [
        Video(id: "cheetah", name: "Cheetah", headline: "Cheetah walking in the savannah"),
        Video(id: "elephant", name: "Elephant", headline: "African elephant with calf walking")
    ]

    // MARK: - Location / Locations
    
    static var location: ParkLocation = ParkLocation(
        id: "serengeti",
        name: "Serengeti National Park",
        image: "map-serengeti",
        latitude: -2.3333333,
        longitude: 34.8333333
    )
    
    static var locations: [ParkLocation] = [
        ParkLocation(
            id: "serengeti",
            name: "Serengeti National Park",
            image: "map-serengeti",
            latitude: -2.3333333,
            longitude: 34.8333333
        ),
        ParkLocation(
            id: "kruger",
            name: "Kruger National Park",
            image: "map-kruger",
            latitude: -23.9883848,
            longitude: 31.5525515
        )
    ]

}
