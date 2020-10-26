//
//  DetailVCConstraints.swift
//  MatinyNikeChallenge
//
//  Created by Matiny L on 10/22/20.
//  Copyright © 2020 Matiny L. All rights reserved.
//

import UIKit

extension AlbumDetail {
    
    func setupConstraints() {
        
        func setupArtViewContraints() {
            artViewLarge.topAnchor.constrain(to: contentScrollView.topAnchor)
            artViewLarge.leadingAnchor.constrain(.greaterThanOrEqual, to: view.leadingAnchor, with: CustomDimensions.padding, prioritizeAs: .defaultLow)
            artViewLarge.trailingAnchor.constrain(.greaterThanOrEqual, to: view.trailingAnchor, with: -CustomDimensions.padding, prioritizeAs: .defaultLow)
            artViewLarge.heightAnchor.constrain(to: CustomDimensions.largeImageHeight)
            artViewLarge.widthAnchor.constrain(to: artViewLarge.heightAnchor, multiplyBy: 1)
            artViewLarge.centerXAnchor.constrain(to: view.centerXAnchor)
        }
        
        func setupTitleNameConstraints() {
            titleName.topAnchor.constrain(to: artViewLarge.bottomAnchor, with: CustomDimensions.padding)
            titleName.leadingAnchor.constrain(to: view.safeAreaLayoutGuide.leadingAnchor, with: CustomDimensions.outerPadding)
            titleName.trailingAnchor.constrain(to: view.safeAreaLayoutGuide.trailingAnchor, with: -CustomDimensions.outerPadding)
        }
        
        func setupArtistNameConstraints() {
            artistName.leadingAnchor.constrain(to: titleName.leadingAnchor)
            artistName.topAnchor.constrain(to: titleName.bottomAnchor, with: CustomDimensions.padding)
            artistName.trailingAnchor.constrain(to: titleName.trailingAnchor)
        }
        
        func setupGenreContraints() {
            genreLabel.leadingAnchor.constrain(to: titleName.leadingAnchor)
            genreLabel.topAnchor.constrain(to: artistName.bottomAnchor, with: CustomDimensions.padding)
            genreLabel.trailingAnchor.constrain(to: titleName.trailingAnchor)
        }
        
        func setupReleastDateConstraints() {
            releastDate.leadingAnchor.constrain(to: titleName.leadingAnchor)
            releastDate.topAnchor.constrain(to: genreLabel.bottomAnchor, with: CustomDimensions.padding)
            releastDate.trailingAnchor.constrain(to: titleName.trailingAnchor)
        }
        
        func setupCopyrightConstraints() {
            copyrightInfo.leadingAnchor.constrain(to: titleName.leadingAnchor)
            copyrightInfo.topAnchor.constrain(to: releastDate.bottomAnchor, with: CustomDimensions.padding)
            copyrightInfo.trailingAnchor.constrain(to: titleName.trailingAnchor)
        }
        
        func setupItunesConstraints() {
            iTunesButton.topAnchor.constrain(.greaterThanOrEqual, to: copyrightInfo.bottomAnchor, with: CustomDimensions.padding*3, prioritizeAs: UILayoutPriority(rawValue: 998))
            iTunesButton.leadingAnchor.constrain(to: view.safeAreaLayoutGuide.leadingAnchor, with: CustomDimensions.outerPadding)
            iTunesButton.trailingAnchor.constrain(to: view.safeAreaLayoutGuide.trailingAnchor, with: -CustomDimensions.outerPadding)
            iTunesButton.bottomAnchor.constrain(to: view.safeAreaLayoutGuide.bottomAnchor, with: -CustomDimensions.outerPadding, prioritizeAs: UILayoutPriority(rawValue: 999))
        }
        
        setupArtViewContraints()
        setupTitleNameConstraints()
        setupArtistNameConstraints()
        setupGenreContraints()
        setupReleastDateConstraints()
        setupCopyrightConstraints()
        setupItunesConstraints()
        
    }
    
}
