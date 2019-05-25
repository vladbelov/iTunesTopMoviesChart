//
//  MainTableViewCell.swift
//  TopMovies
//
//  Created by Владислав on 21/02/2019.
//  Copyright © 2019 Владислав. All rights reserved.
//

import UIKit
import SDWebImage

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    
    func setupCell(movie: MovieInfo) {
        movieNameLabel.text = movie.name?.label
        movieImageView.sd_setImage(with: URL(string: movie.image![2].label ?? ""))
    }
}
