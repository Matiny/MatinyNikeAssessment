//
//  ViewController.swift
//  MatinyNikeChallenge
//
//  Created by Matiny L on 10/14/20.
//  Copyright © 2020 Matiny L. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var albums = [Album]()
    
    // MARK: Table Setup
    
    private let table = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.delegate = self
        table.dataSource = self
        
        let anon = {
            (fetchedAlbumList: [Album]) in
            DispatchQueue.main.async {
                self.albums = fetchedAlbumList
                self.table.reloadData()
            }
        }
        
        AlbumAPI.shared.getAlbumData(onCompletion: anon)
    }
    
    func setupView() {
        view.addSubview(table)
        table.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = albums[indexPath.row].artistName
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Code
    }


}

