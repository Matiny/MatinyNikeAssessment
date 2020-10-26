//
//  NikeAlbumTest.swift
//  MatinyNikeChallengeTests
//
//  Created by Matiny L on 10/23/20.
//  Copyright © 2020 Matiny L. All rights reserved.
//

import XCTest
@testable import MatinyNikeChallenge

class AlbumTest: XCTestCase {
    
    var sut: Main?
    
    override func setUpWithError() throws {
        let testBundle = Bundle(for: type(of: self))
        if let path = testBundle.path(forResource: "mockData", ofType: "json") {
            if let albumJSON = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped) {
                let decoder = JSONDecoder()
                let albumResponses = try? decoder.decode(Main.self, from: albumJSON)
                sut = albumResponses
            }
        }
    }

    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
    }
    
    func test_AlbumDecodedFromMockData() {
        guard let sut = sut else { return }
        let albumDetails = sut.feed.results
        XCTAssertEqual(albumDetails.count, 1, "One entry should be in album")
        
    }

    func test_MainModelCanTakeAlbumArray() {
        let oneAblum = Album(artistName: "", name: "Test Album", artworkUrl100:"", releaseDate: "", copyright: "", genres: [], url: "")
        let albums = Array(repeating: oneAblum, count: 3)
        let author = ["name": "Test Name"]
        let all = Main(feed: Content(title: "", id: "1", author: author, results: albums))
    
        XCTAssertTrue(all.feed.results.first?.name == "Test Album", "Main model can contain album array")
    }
    
    func test_AlbumHasGenreArray() {
        guard let sut = sut else { return }
        let albumDetails = sut.feed.results
        let genres = albumDetails.first?.genres
        
        XCTAssertNotNil(genres?.first)
    }
    
}



