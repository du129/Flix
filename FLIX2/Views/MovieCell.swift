//
//  MovieCell.swift
//  FLIX2
//
//  Created by Jonathan Du on 1/14/18.
//  Copyright © 2018 Jonathan Du. All rights reserved.
//

import UIKit
import AlamofireImage
class MovieCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    var movie: Movie! {
        didSet{
            titleLabel.text = movie.title
            overviewLabel.text = movie.overview
            let baseURLString = "https://image.tmdb.org/t/p/w500"
            posterImageView.af_setImage(withURL: URL(string: baseURLString+movie.posterURL)!)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
