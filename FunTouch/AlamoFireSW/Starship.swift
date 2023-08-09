//
//  Starship.swift
//  FunTouch
//
//  Created by Дмитрий on 03.03.2023.
//

struct Starship: Decodable {

    var name: String
    var model: String
    var manufacturer: String
    var cost: String
    var length: String
    var maximumSpees: String
    var crewTotal: String
    var passengerTotal: String
    var cargoCapacity: String
    var consumables: String
    var hyperdriveRating: String
    var starshipsClass: String
    var films: [String]

    enum CodingKeys: String, CodingKey {

        case name
        case model
        case manufacturer
        case cost = "cost_in_credits"
        case length
        case maximumSpees = "max_atmosphering_speed"
        case crewTotal = "crew"
        case passengerTotal = "passengers"
        case cargoCapacity = "cargo_capacity"
        case consumables
        case hyperdriveRating = "hyperdrive_rating"
        case starshipsClass = "starship_class"
        case films

    }
}

extension Starship: Displayable {
    var titleLabelText: String {
        name
    }

    var subtitleLabelText: String {
        model
    }

    var item1: (label: String, value: String) {
        ("Manufacturer", manufacturer)
    }

    var item2: (label: String, value: String) {
        ("Class", starshipsClass)
    }

    var item3: (label: String, value: String) {
        ("Hyperdrive Rating", hyperdriveRating)
    }

    var listTitle: String {
        "Films"
    }

    var listItems: [String] {
        films
    }

}
