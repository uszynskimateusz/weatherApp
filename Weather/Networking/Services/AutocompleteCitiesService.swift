//
//  AutocompleteCitiesService.swift
//

public protocol AutocompleteCitiesServiceProtocol {
    func fetchAutocompleteCities(city: String) async throws -> [AutocompleteCity]
}

public final class AutocompleteCitiesService: AutocompleteCitiesServiceProtocol {
    private let httpClient: HttpClient

    public init(httpClient: HttpClient) {
        self.httpClient = httpClient
    }

    public func fetchAutocompleteCities(city: String) async throws -> [AutocompleteCity] {
        let endpoint = AutocompleteSearchEndpoint(city: city)
        let autocompleteCities: [AutocompleteCityDTO] = try await httpClient.request(route: endpoint)
        let mapper = AutocompleteCityMapper()
        let mappedAutocompleteCities = autocompleteCities.map(mapper.map)
        return mappedAutocompleteCities.sorted { $0.rank < $1.rank }
    }
}
