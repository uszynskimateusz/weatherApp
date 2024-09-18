//
//  Forecast.swift
//

import UIKit

public struct Forecast {
    let headline: String
    let dailyForecasts: [DailyForecast]

    init(headline: String, dailyForecasts: [DailyForecast]) {
        self.headline = headline
        self.dailyForecasts = dailyForecasts
    }
}

public struct DailyForecast {
    private let date: String
    private let temperature: Temperature
    private let day: Day

    public init(date: String, temperature: Temperature, day: Day) {
        self.date = date
        self.temperature = temperature
        self.day = day
    }

    var dateValue: Date {
        ISO8601DateFormatter().date(from: date) ?? Date()
    }

    var formattedDateValue: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM"
        return formatter.string(from: dateValue)
    }

    var isToday: Bool {
        Calendar.current.isDateInToday(dateValue)
    }

    var maximumTemperature: String {
        temperature.maximum.formattedTemperature
    }

    var maximumTemperatureColor: UIColor {
        temperature.maximum.textColor
    }

    var minimumTemperature: String {
        temperature.minimum.formattedTemperature
    }

    var minimumTemperatureColor: UIColor {
        temperature.minimum.textColor
    }

    var wind: String {
        day.wind.speed.formattedValue
    }

    var rain: String {
        day.rain.formattedValue
    }

    var snow: String {
        day.snow.formattedValue
    }
}

public struct Temperature {
    let minimum: TemperatureValue
    let maximum: TemperatureValue

    public init(minimum: TemperatureValue, maximum: TemperatureValue) {
        self.minimum = minimum
        self.maximum = maximum
    }
}

public struct Day {
    let wind: Wind
    let rain: Value
    let snow: Value
}

public struct Wind {
    let speed: Value
}

public struct Value {
    private let value: Float
    private let unit: String

    public init(value: Float, unit: String) {
        self.value = value
        self.unit = unit
    }

    var formattedValue: String {
        "\(value) \(unit)"
    }
}

public struct TemperatureValue {
    private let value: Float
    private let unit: String

    public init(value: Float, unit: String) {
        self.value = value
        self.unit = unit
    }

    var formattedTemperature: String {
        "\(value) °\(unit)"
    }

    var textColor: UIColor {
        if value < 10 {
            return .blue
        } else if value > 20 {
            return .red
        } else {
            return .black
        }
    }
}
