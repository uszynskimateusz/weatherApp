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

    enum CodingKeys: String, CodingKey {
        case date = "Date"
        case temperature = "Temperature"
    }
}

struct TemperatureDTO: Decodable {
    let minimum: TemperatureValueDTO
    let maximum: TemperatureValueDTO

    enum CodingKeys: String, CodingKey {
        case minimum = "Minimum"
        case maximum = "Maximum"
    }
}

struct TemperatureValueDTO: Decodable {
    let value: Float
    let unit: String

    enum CodingKeys: String, CodingKey {
        case value = "Value"
        case unit = "Unit"
    }
}
