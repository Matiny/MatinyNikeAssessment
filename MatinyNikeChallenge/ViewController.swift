//
//  ViewController.swift
//  MatinyNikeChallenge
//
//  Created by Matiny L on 10/14/20.
//  Copyright © 2020 Matiny L. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var albums = [Album]() {
        didSet {
            DispatchQueue.main.async {
                self.table.reloadData()
            }
        }
    }
    
    // MARK: Table Setup
    
    private let table = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        table.register(CustomCell.self, forCellReuseIdentifier: "cell")
        table.delegate = self
        table.dataSource = self
        
        
        loadAlbumData()
    }
    
    func setupView() {
        view.addSubview(table)
        table.rowHeight = 200
        table.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        guard let customCell = cell as? CustomCell else { return cell }
        
        customCell.artistLabel.text = albums[indexPath.row].artistName
        customCell.albumLabel.text = albums[indexPath.row].name
        
        if let url = URL(string: albums[indexPath.row].artworkUrl100) {
            customCell.customImage.loadImage(from: url)
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let oneAlbum = albums[indexPath.row]
        let albumDetail = AlbumDetail()
        albumDetail.info = oneAlbum
        albumDetail.modalPresentationStyle = .fullScreen
        present(albumDetail, animated: true)
    }
    
    func loadAlbumData() {
        let albumInfo = AlbumAPI()
        albumInfo.getAlbumData { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let albums):
                self?.albums.append(contentsOf: albums)
            }
        }
    }

}

