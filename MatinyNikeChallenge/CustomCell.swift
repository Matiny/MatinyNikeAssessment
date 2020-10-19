//
//  CustomCell.swift
//  MatinyNikeChallenge
//
//  Created by Matiny L on 10/17/20.
//  Copyright © 2020 Matiny L. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    let customImage = CustomImageView()
    let artistLabel = UILabel()
    let albumLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup
    
    func setupView() {
        setupImageView()
        setupArtistLabel()
        setupAlbumLabel()
    }
    
    func setupImageView() {
        addSubview(customImage)
        customImage.translatesAutoresizingMaskIntoConstraints = false
        customImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        customImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        customImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
        customImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func setupArtistLabel() {
        addSubview(artistLabel)
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.leadingAnchor.constraint(equalTo: customImage.trailingAnchor, constant: 5).isActive = true
        artistLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
    }
    
    func setupAlbumLabel() {
        addSubview(albumLabel)
        
        albumLabel.translatesAutoresizingMaskIntoConstraints = false
        albumLabel.leadingAnchor.constraint(equalTo: artistLabel.leadingAnchor).isActive = true
        albumLabel.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 5).isActive = true
    }
    
}
