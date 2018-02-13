//
//  Movie.swift
//  FLIX2
//
//  Created by Jonathan Du on 2/12/18.
//  Copyright © 2018 Jonathan Du. All rights reserved.
//

import Foundation


class Movie {
    var title: String
    var overview: String
    var posterURL: String
    var releaseDate: String
    var backdropPathString: String
    var posterUrl: URL?
    var movies: [[String: Any]] = []

    
    init(dictionary: [String: Any]) {        
        // Set the rest of the properties
        title = dictionary["title"] as? String ?? "No title"
        overview = dictionary["overview"] as? String ?? "No title"
        posterURL = dictionary["poster_path"] as? String ?? "No title"
        releaseDate = dictionary["release_date"] as? String ?? "No title"
        backdropPathString = dictionary["backdrop_path"] as? String ?? "No title"
    }
    
    class func movies(dictionaries: [[String: Any]]) -> [Movie] {
        var movies: [Movie] = []
        for dictionary in dictionaries {
            let movie = Movie(dictionary: dictionary)
            movies.append(movie)
        }
        
        return movies
    }
}
