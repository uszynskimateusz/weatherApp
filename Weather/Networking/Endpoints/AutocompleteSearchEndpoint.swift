//
//  AutocompleteSearchEndpoint.swift
//

struct AutocompleteSearchEndpoint: HttpEndpointProtocol {
    let city: String

    init(city: String) {
        self.city = city
    }

    var path: String = "locations/v1/cities/autocomplete"
    var method: HttpMethod = .get

    var queryParams: [String : Any] {
        [
            "apikey": AppConstants.apiKey,
            "q": city,
            "language": "pl"
        ]
    }
}
