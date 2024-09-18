//
//  ForecastServiceMock.swift
//

@testable import Weather

final class ForecastServiceMock: ForecastServiceProtocol {
    func fetchForecast(cityKey: String) async throws -> Forecast {
        Forecast(headline: "Słoneczna pogoda", dailyForecasts: [
            DailyForecast(date: "2024-09-18T07:00:00+02:00",
                          temperature: Temperature(minimum: TemperatureValue(value: 12.4, unit: "C"),
                                                   maximum: TemperatureValue(value: 24.5, unit: "C")),
                          day: Day(wind: Wind(speed: Value(value: 13.0, unit: "km/h")),
                                   rain: Value(value: 0.0, unit: "mm"),
                                   snow: Value(value: 0.0, unit: "cm"))),
            DailyForecast(date: "2024-09-19T07:00:00+02:00",
                          temperature: Temperature(minimum: TemperatureValue(value: 26.4, unit: "C"),
                                                   maximum: TemperatureValue(value: 33.5, unit: "C")),
                          day: Day(wind: Wind(speed: Value(value: 3.0, unit: "km/h")),
                                   rain: Value(value: 0.0, unit: "mm"),
                                   snow: Value(value: 0.0, unit: "cm"))),
            DailyForecast(date: "2024-09-20T07:00:00+02:00",
                          temperature: Temperature(minimum: TemperatureValue(value: 0.4, unit: "C"),
                                                   maximum: TemperatureValue(value: 4.5, unit: "C")),
                          day: Day(wind: Wind(speed: Value(value: 1.0, unit: "km/h")),
                                   rain: Value(value: 4.0, unit: "mm"),
                                   snow: Value(value: 1.0, unit: "cm"))),
            DailyForecast(date: "2024-09-21T07:00:00+02:00",
                          temperature: Temperature(minimum: TemperatureValue(value: 22.4, unit: "C"),
                                                   maximum: TemperatureValue(value: 25.5, unit: "C")),
                          day: Day(wind: Wind(speed: Value(value: 6.0, unit: "km/h")),
                                   rain: Value(value: 0.0, unit: "mm"),
                                   snow: Value(value: 0.0, unit: "cm"))),
            DailyForecast(date: "2024-09-22T07:00:00+02:00",
                          temperature: Temperature(minimum: TemperatureValue(value: 9.4, unit: "C"),
                                                   maximum: TemperatureValue(value: 12.5, unit: "C")),
                          day: Day(wind: Wind(speed: Value(value: 9.0, unit: "km/h")),
                                   rain: Value(value: 0.0, unit: "mm"),
                                   snow: Value(value: 1.0, unit: "cm"))),
            DailyForecast(date: "2024-09-23T07:00:00+02:00",
                          temperature: Temperature(minimum: TemperatureValue(value: 19.4, unit: "C"),
                                                   maximum: TemperatureValue(value: 25.5, unit: "C")),
                          day: Day(wind: Wind(speed: Value(value: 22.0, unit: "km/h")),
                                   rain: Value(value: 5.0, unit: "mm"),
                                   snow: Value(value: 0.0, unit: "cm")))
        ])
    }
}
