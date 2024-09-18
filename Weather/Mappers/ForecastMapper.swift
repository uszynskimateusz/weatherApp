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
                                                                             unit: dto.temperature.maximum.unit)))
        }
        return Forecast(headline: model.headline.text,
                        dailyForecasts: dailyForecasts)
    }
}
