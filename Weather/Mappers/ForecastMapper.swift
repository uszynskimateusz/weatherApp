//
//  ForecastMapper.swift
//

public final class ForecastMapper {
    public init() {}

    func map(fromModel model: ForecastDTO) -> Forecast {
        let dailyForecasts = model.dailyForecasts.map { dto in
            DailyForecast(date: dto.date,
                          temperature: Temperature(minimum: TemperatureValue(value: dto.temperature.minimum.value,
                                                                             unit: dto.temperature.minimum.unit),
                                                   maximum: TemperatureValue(value: dto.temperature.maximum.value,
                                                                             unit: dto.temperature.maximum.unit)),
                          day: Day(wind: Wind(speed: .init(value: dto.day.wind.speed.value,
                                                           unit: dto.day.wind.speed.unit)),
                                   rain: .init(value: dto.day.rain.value,
                                               unit: dto.day.rain.unit),
                                   snow: .init(value: dto.day.snow.value,
                                               unit: dto.day.snow.unit)))
        }
        return Forecast(headline: model.headline.text,
                        dailyForecasts: dailyForecasts)
    }
}
