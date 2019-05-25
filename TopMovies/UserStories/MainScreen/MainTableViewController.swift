//
//  MainTableViewController.swift
//  TopMovies
//
//  Created by Владислав on 21/02/2019.
//  Copyright © 2019 Владислав. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    private var moviesArray = [MovieInfo]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl?.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        tableView.addSubview(refreshControl ?? UIView())
        
        tableView.tableFooterView = UIView()
        
        navigationItem.title = "Top 25 Movies"
//        definesPresentationContext = true
        
        BaseRequest.shared.request { (result) in
            switch result {
            case .success(let movies):
                self.moviesArray = movies
            case .error(let err):
                self.showAlert(title: "Error!", message: err.localizedDescription)
            }
        }
    }
    
    @objc func refresh() {
        enum Result {
            case success
            case error
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        
        cell.setupCell(movie: moviesArray[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.movie = moviesArray[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
