//
//  Album.swift
//  MatinyNikeChallenge
//
//  Created by Matiny L on 10/22/20.
//  Copyright © 2020 Matiny L. All rights reserved.
//

import Foundation

struct Main: Codable {
    let feed: Content
}

struct Content: Codable {
    let title: String
    let id: String
    let author: [String: String]
    let results: [Album]
}

struct Album: Codable {
    let artistName: String
    let name: String
    let artworkUrl100: String
    let releaseDate: String
    let copyright: String
    let genres: [OneGenre]
    let url: String
}

struct OneGenre: Codable {
    let name: String
}
