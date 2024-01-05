//
//  Album.swift
//  AnimatedStickyHeader
//
//  Created by Naman Vaishnav on 05/01/24.
//

import Foundation


struct Album: Identifiable {
    var id = UUID().uuidString
    var albumName: String
}

var albums: [Album] = [
    Album (albumName: "Forest Sounds"),
    Album (albumName: "Rain Sounds"),
    Album (albumName: "Bird Sounds "),
    Album (albumName: "fire sound"),
    Album (albumName: "Forest Sounds"),
    Album (albumName: "Rain Sounds"),
    Album (albumName: "Bird Sounds "),
    Album (albumName: "Forest Sounds"),
    Album(albumName: "Rain Sounds"),
    Album (albumName: "Bird Sounds "),
]
