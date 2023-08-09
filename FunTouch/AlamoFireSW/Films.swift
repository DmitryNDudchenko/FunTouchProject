//
//  Films.swift
//  FunTouch
//
//  Created by Дмитрий on 03.03.2023.
//

struct Films: Decodable {

    let count: Int
    let all: [Film]

    enum CodingKeys: String, CodingKey {
        case count
        case all = "results"
    }
}
