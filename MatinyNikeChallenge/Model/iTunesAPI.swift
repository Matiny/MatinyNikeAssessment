//
//  iTunesAPI.swift
//  MatinyNikeChallenge
//
//  Created by Matiny L on 10/14/20.
//  Copyright © 2020 Matiny L. All rights reserved.
//

import Foundation

class AlbumAPI {
    
    func getAlbumData(onCompletion: @escaping (Result<[Album], AlbumRequestError>) -> Void) {
        
        let urlString = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit.json"
        
        guard let url = URL(string: urlString) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {
                onCompletion(.failure(.noDataAvailable))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let feedResponses = try decoder.decode(Main.self, from: data)
                let albumDetails = feedResponses.feed.results
                onCompletion(.success(albumDetails))
            } catch {
                onCompletion(.failure(.cannotDecodeData))
            }
    
        }
        task.resume()
    }
}

enum AlbumRequestError: Error {
    case noDataAvailable
    case cannotDecodeData
}
