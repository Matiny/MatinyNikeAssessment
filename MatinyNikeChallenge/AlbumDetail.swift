//
//  Album Details.swift
//  MatinyNikeChallenge
//
//  Created by Matiny L on 10/18/20.
//  Copyright © 2020 Matiny L. All rights reserved.
//

import UIKit

class AlbumDetail: UIViewController {
    
    var info: Album?
    
    let albumImage = CustomImageView()
    let artistLabel = UILabel()
    let iTunesButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupImage()
        loadAlbumImage()
        setupArtistLabel()
        setupiTunesButton()
    }
    
    func setupImage() {
        view.addSubview(albumImage)
        albumImage.translatesAutoresizingMaskIntoConstraints = false
        
        albumImage.contentMode = .scaleAspectFit
        albumImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        albumImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        albumImage.widthAnchor.constraint(equalToConstant: view.frame.width / 1.5).isActive = true
        albumImage.heightAnchor.constraint(equalToConstant: view.frame.width / 1.5).isActive = true
    }
    
    func setupiTunesButton() {
        view.addSubview(iTunesButton)
        
        iTunesButton.translatesAutoresizingMaskIntoConstraints = false
        iTunesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        iTunesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        iTunesButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        iTunesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        iTunesButton.setTitle("View in iTunes", for: .normal)
        iTunesButton.setTitleColor(.white, for: .normal)
        
        iTunesButton.backgroundColor = .darkGray
        
        iTunesButton.addTarget(self, action: #selector(openiTunes), for: .touchUpInside)
    }
    
    func setupArtistLabel() {
        view.addSubview(artistLabel)
        
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.topAnchor.constraint(equalTo: albumImage.bottomAnchor, constant: 30).isActive = true
        artistLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func loadAlbumImage() {
        if
            let albumInfo = info,
            let url = URL(string: albumInfo.artworkUrl100)
        {
            albumImage.loadImage(from: url)
            artistLabel.text = info?.artistName
        }
    }
    
    @objc func openiTunes() {
        print("Testing")
    }
}
