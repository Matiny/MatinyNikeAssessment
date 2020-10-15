//
//  iTunesAPI.swift
//  MatinyNikeChallenge
//
//  Created by Matiny L on 10/14/20.
//  Copyright © 2020 Matiny L. All rights reserved.
//

import Foundation

struct Main: Codable {
    let feed: Content
}

struct Content: Codable {
    let results: [Album]
}

struct Album: Codable {
    let artistName: String
    let name: String
    let artworkUrl100: String // Later make this a URL
    let releaseDate: String
    let copyright: String
    let genres: [OneGenre]
}

struct OneGenre: Codable {
    let name: String
}

class AlbumAPI {
    
    static let shared = AlbumAPI()
    
    func getAlbumData(onCompletion: @escaping ([Album]) -> ()) {
        
        let urlString = "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/100/explicit.json"
        
        guard let url = URL(string: urlString) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {
                print("data was nil!")
                return
            }
            
            guard let albumList = try? JSONDecoder().decode(Main.self, from: data) else {
                print("JSON could not be decoded!")
                return
            }
            
            onCompletion(albumList.feed.results)
    
        }
        task.resume()
    }
    
    
}

