//
//  MovieCollectionViewCell.swift
//  FunTouch
//
//  Created by Дмитрий on 25.12.2022.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var movieImageView: UIImageView!

    @IBOutlet weak var titleLable: UILabel!


    func update(with movie: Movie){
        movieImageView.image = movie.image
        titleLable.text = movie.title
    }


}
