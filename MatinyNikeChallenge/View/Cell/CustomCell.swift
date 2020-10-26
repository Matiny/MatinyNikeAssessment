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
        addSubviews(customImage, artistLabel, albumLabel)
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup
    
    func setupView() {
        
        func setupImageView() {

            customImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
            customImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            customImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
            customImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
        }
        
        func setupAlbumLabel() {
            albumLabel.numberOfLines = 0
            albumLabel.leadingAnchor.constraint(equalTo: customImage.trailingAnchor, constant: 10).isActive = true
            albumLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
            albumLabel.font = UIFont.preferredFont(forTextStyle: .headline)
            albumLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        }
        
        func setupArtistLabel() {
            artistLabel.numberOfLines = 0
            artistLabel.leadingAnchor.constraint(equalTo: albumLabel.leadingAnchor).isActive = true
            artistLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
            artistLabel.topAnchor.constraint(equalTo: albumLabel.bottomAnchor, constant: 10).isActive = true
            artistLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        }
        
        setupImageView()
        setupAlbumLabel()
        setupArtistLabel()
    }
    
    
    
    
    
    
    
}
