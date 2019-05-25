//
//  DetailViewController.swift
//  TopMovies
//
//  Created by Владислав on 21/02/2019.
//  Copyright © 2019 Владислав. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var movie: MovieInfo?

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMovieData()
        descriptionTextView.isEditable = false
    }
    
    func setupMovieData() {
        guard let movie = movie else { return }
        
        navigationItem.title = movie.name?.label
        nameLabel.text = movie.title?.label
        genreLabel.text = movie.category?.attributes?.label
        descriptionTextView.text = movie.summary?.label
        detailImageView.sd_setImage(with: URL(string: movie.image![2].label ?? ""))
    }
}
