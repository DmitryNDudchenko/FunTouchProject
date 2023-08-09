//
//  Film.swift
//  FunTouch
//
//  Created by Дмитрий on 03.03.2023.
//

struct Film: Decodable {

    let id: Int
    let title: String
    let openingCrawl: String
    let director: String
    let producer: String
    let releaseData: String
    let starships: [String]

    enum CodingKeys: String, CodingKey {

        case id = "episode_id"
        case title
        case openingCrawl = "opening_crawl"
        case director
        case producer
        case releaseData = "release_date"
        case starships
    }
}

extension Film: Displayable {

    var titleLabelText: String{
        title
    }

    var subtitleLabelText: String{
        "Episode \(String(id))"
    }

    var item1: (label: String, value: String){
        ("Director", director)
    }
    var item2: (label: String, value: String){
        ("Producer", producer)
    }
    var item3: (label: String, value: String){
        ("Release Data", releaseData)
    }

    var listTitle: String{
        "Starships"
    }

    var listItems: [String] {
        starships
    }
    
}
