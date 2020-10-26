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
    
    let albumImage = CustomImageView(),
    artistLabel = UILabel(),
    albumLabel = UILabel(),
    genreLabel = UILabel(),
    releaseDate = UILabel(),
    copyrightInfo = UILabel(),
    iTunesButton = UIButton(),
    backButton = UIButton(),
    contentScrollView = UIScrollView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubviews(albumImage, artistLabel, albumLabel, genreLabel, releaseDate, copyrightInfo, backButton, iTunesButton)
        fullSetup()
    }
    
    
    func fullSetup() {
        
        func configureLabels(labels: UILabel...) {
            for label in labels {
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = 0
                label.lineBreakMode = .byWordWrapping
                label.adjustsFontSizeToFitWidth = true
                label.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
                label.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
                label.textAlignment = .center
            }
        }
        
        func setupImage() {
            albumImage.translatesAutoresizingMaskIntoConstraints = false
            
            albumImage.contentMode = .scaleAspectFit
            albumImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            albumImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
            albumImage.widthAnchor.constraint(equalToConstant: view.frame.width / 1.5).isActive = true
            albumImage.heightAnchor.constraint(equalToConstant: view.frame.width / 1.5).isActive = true
        }
        
        func setupiTunesButton() {
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
        
        func setupbackButton() {
            backButton.translatesAutoresizingMaskIntoConstraints = false
            
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
            backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
            backButton.bottomAnchor.constraint(equalTo: iTunesButton.topAnchor, constant: -20).isActive = true
            
            backButton.setTitle("Back to Albums", for: .normal)
            backButton.setTitleColor(.white, for: .normal)
            
            backButton.backgroundColor = .darkGray
            
            backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        }
        
        func setupArtistLabel() {
            artistLabel.topAnchor.constraint(equalTo: albumImage.bottomAnchor, constant: 30).isActive = true
        }
        
        func setupAlbumLabel() {
            albumLabel.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 15).isActive = true
        }
        
        func setupGenreLabel() {
            genreLabel.topAnchor.constraint(equalTo: albumLabel.bottomAnchor, constant: 15).isActive = true
        }
        
        func setupDateLabel() {
            releaseDate.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: 15).isActive = true
        }
        
        func setupCopyLabel() {
            copyrightInfo.topAnchor.constraint(equalTo: releaseDate.bottomAnchor, constant: 15).isActive = true
        }
        
        func loadAlbumContent() {
            if
                let albumInfo = info,
                let url = URL(string: albumInfo.artworkUrl100)
            {
                albumImage.loadImage(from: url)
                artistLabel.text = albumInfo.artistName
                albumLabel.text = albumInfo.name
                genreLabel.text = albumInfo.genres[0].name
                releaseDate.text = albumInfo.releaseDate
                copyrightInfo.text = albumInfo.copyright
            }
        }
        
        setupImage()
        loadAlbumContent()
        setupArtistLabel()
        setupAlbumLabel()
        setupGenreLabel()
        setupDateLabel()
        setupCopyLabel()
        setupiTunesButton()
        setupbackButton()
        configureLabels(labels: artistLabel, albumLabel, genreLabel, releaseDate, copyrightInfo)
    }
    
    
    
    @objc func openiTunes() {
        
        guard let albumAddress = info.url?.dropFirst(8) else { return }
        let trimmedAddress = String(albumAddress.dropLast(5))
        let itunesLink = "itms://" + trimmedAddress + "itunes"
        if let urlScheme = URL(string: itunesLink) {
            if UIApplication.shared.canOpenURL(urlScheme) {
                UIApplication.shared.open(urlScheme)
            }
        }
    }
    
    
    @objc func backButtonPressed() {
        self.dismiss(animated: true)
    }
}
