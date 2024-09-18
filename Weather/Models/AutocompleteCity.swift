//
//  AutocompleteCity.swift
//

struct AutocompleteCity: Decodable {
    let localizedName: String
    let key: String
    let rank: Int

    enum CodingKeys: String, CodingKey {
        case localizedName = "LocalizedName"
        case key = "Key"
        case rank = "Rank"
    }
}
