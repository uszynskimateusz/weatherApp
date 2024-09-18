//
//  SearchHistory.swift
//

import Foundation

public struct SearchHistoryCity: Codable, Hashable {
    let city: AutocompleteCity
    let date: Date
}
