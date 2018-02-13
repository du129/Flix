//
//  NowPlayingViewController.swift
//  FLIX2
//
//  Created by Jonathan Du on 1/14/18.
//  Copyright © 2018 Jonathan Du. All rights reserved.
//

import UIKit
import AlamofireImage
class NowPlayingViewController: UIViewController, UITableViewDataSource {
    
    var movies: [Movie] = []
    @IBOutlet weak var activityIndictor: UIActivityIndicatorView!
    var refreshControl: UIRefreshControl!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(NowPlayingViewController.didPullToRefresh(_:)), for: .valueChanged)
        tableView.insertSubview(refreshControl, at: 0)
        tableView.dataSource = self
        
        fetchMovies()


        // Do any additional setup after loading the view.
        
    }
    
    @objc func didPullToRefresh(_ refreshControl: UIRefreshControl){
        fetchMovies()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        cell.movie = movies[indexPath.row]
        
        
        
        return cell
    }
    
    func fetchMovies(){
        activityIndictor.startAnimating()
        MovieApiManager().nowPlayingMovies { (movies: [Movie]?, error: Error?) in
            if let movies = movies {
                self.movies = movies
                self.tableView.reloadData()
            }
        }
        activityIndictor.stopAnimating()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        if let indexPath = tableView.indexPath(for: cell){
            let movie = movies[indexPath.row]
            let detailViewController = segue.destination as!  DetailViewController
            detailViewController.movie = movie
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
