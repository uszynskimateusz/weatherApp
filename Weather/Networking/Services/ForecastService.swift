//
//  ForecastService.swift
//

public protocol ForecastServiceProtocol {
    func fetchForecast(cityKey: String) async throws -> Forecast
}

public final class ForecastService: ForecastServiceProtocol {
    private let httpClient: HttpClient

    public init(httpClient: HttpClient) {
        self.httpClient = httpClient
    }

    public func fetchForecast(cityKey: String) async throws -> Forecast {
        let endpoint = DailyForecastEndpoint(cityKey: cityKey)
        let forecast: ForecastDTO = try await httpClient.request(route: endpoint)
        let mapper = ForecastMapper()
        return mapper.map(fromModel: forecast)
    }
}
