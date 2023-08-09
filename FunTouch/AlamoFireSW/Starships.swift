//
//  Starships.swift
//  FunTouch
//
//  Created by Дмитрий on 03.03.2023.
//

struct Starships: Decodable {

    let count: Int
    let all: [Starship]

    enum CodingKeys: String, CodingKey {
        case count
        case all = "results"
    }
}
