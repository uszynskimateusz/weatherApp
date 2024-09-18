//
//  AutocompleteCitiesServiceMock.swift
//

@testable import Weather

final class AutocompleteCitiesServiceMock: AutocompleteCitiesServiceProtocol {
    private let cities: [AutocompleteCity]

    init(cities: [AutocompleteCity]) {
        self.cities = cities
    }

    func fetchAutocompleteCities(city: String) async throws -> [AutocompleteCity] {
        return cities
    }
}
