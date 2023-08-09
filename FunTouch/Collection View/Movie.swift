//
//  Movie.swift
//  FunTouch
//
//  Created by Дмитрий on 25.12.2022.
//

import Foundation
import UIKit

struct Movie{
    let title: String
    let image: UIImage
}

let movies: [Movie] = [
    Movie(title: "Hightown", image: #imageLiteral(resourceName: "inTheDark")),
    Movie(title: "Penny Dreadful", image: #imageLiteral(resourceName: "pennyDreadful")),
    Movie(title: "The Bold Type", image: #imageLiteral(resourceName: "blindspot")),
    Movie(title: "Blindspot", image: #imageLiteral(resourceName: "siren")),
    Movie(title: "In the Dark", image: #imageLiteral(resourceName: "theHundred")),
    Movie(title: "Doom patrol", image: #imageLiteral(resourceName: "siren")),
    Movie(title: "Agent of S.H.E.I.L.D", image: #imageLiteral(resourceName: "agentsOfShield")),
    Movie(title: "The 100", image: #imageLiteral(resourceName: "hightown")),
    Movie(title: "DC Lagends of tomorrow", image: #imageLiteral(resourceName: "inTheDark")),
    Movie(title: "Siren", image: #imageLiteral(resourceName: "blindspot"))
]
