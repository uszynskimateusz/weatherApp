//
//  ForecastDTO.swift
//

import UIKit

struct ForecastDTO: Decodable {
    let headline: HeadlineDTO
    let dailyForecasts: [DailyForecastDTO]

    enum CodingKeys: String, CodingKey {
        case headline = "Headline"
        case dailyForecasts = "DailyForecasts"
    }
}

struct HeadlineDTO: Decodable {
    let text: String

    enum CodingKeys: String, CodingKey {
        case text = "Text"
    }
}

struct DailyForecastDTO: Decodable {
    let date: String
    let temperature: TemperatureDTO
    let day: DayDTO

    enum CodingKeys: String, CodingKey {
        case date = "Date"
        case temperature = "Temperature"
        case day = "Day"
    }
}

struct TemperatureDTO: Decodable {
    let minimum: ValueDTO
    let maximum: ValueDTO

    enum CodingKeys: String, CodingKey {
        case minimum = "Minimum"
        case maximum = "Maximum"
    }
}

struct DayDTO: Decodable {
    let wind: WindDTO
    let rain: ValueDTO
    let snow: ValueDTO

    enum CodingKeys: String, CodingKey {
        case wind = "Wind"
        case rain = "Rain"
        case snow = "Snow"
    }
}

struct WindDTO: Decodable {
    let speed: ValueDTO

    enum CodingKeys: String, CodingKey {
        case speed = "Speed"
    }
}

struct ValueDTO: Decodable {
    let value: Float
    let unit: String

    enum CodingKeys: String, CodingKey {
        case value = "Value"
        case unit = "Unit"
    }
}
