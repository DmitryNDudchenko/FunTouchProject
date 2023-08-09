//
//  Track.swift
//  FunTouch
//
//  Created by Дмитрий on 15.02.2023.
//

import Foundation

import Foundation

class Track {

    let artist: String
    let index: Int
    let name: String
    let previewURL: URL

    var downloaded = false

    init(artist: String, index: Int, name: String, previewURL: URL) {
        self.artist = artist
        self.index = index
        self.name = name
        self.previewURL = previewURL
    }
}
