//
//  DailyForecastEndpoint.swift
//

struct DailyForecastEndpoint: HttpEndpointProtocol {
    let cityKey: String

    init(cityKey: String) {
        self.cityKey = cityKey
    }

    var path: String {
        "forecasts/v1/daily/5day/\(cityKey)"
    }
    var method: HttpMethod = .get

    var queryParams: [String : Any] {
        [
            "apikey": AppConstants.apiKey,
            "details": true,
            "metric": true,
            "language": "pl"
        ]
    }
}
