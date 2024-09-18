//
//  CityDetailsViewLayout.swift
//

import UIKit

final class CityDetailsViewLayout: UIView {
    private enum Constants {
        static let margin: CGFloat = 8.0
    }

    private let stackView = UIStackView()
    private let headlineLabel = UILabel()
    private let maxTemperatureLabel = UILabel()
    private let temperatureLabel = UILabel()
    private let minTemperatureLabel = UILabel()
    private let weatherConditions = WeatherConditions()
    private let nextDaysForecast = NextDaysForecast()

    init() {
        super.init(frame: .zero)

        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(_ forecast: Forecast?) {
        guard let forecast else { return }

        headlineLabel.text = forecast.headline

        if let todayForecast = forecast.dailyForecasts.first(where: { $0.isToday }) {
            maxTemperatureLabel.textColor = todayForecast.maximumTemperatureColor
            maxTemperatureLabel.text = todayForecast.maximumTemperature
            minTemperatureLabel.attributedText = buildAttributedText(forecast: todayForecast)
            weatherConditions.configure(with: [
                .wind(todayForecast.wind),
                .rain(todayForecast.rain),
                .snow(todayForecast.snow)
            ])
        }

        nextDaysForecast.configure(with: forecast.dailyForecasts.filter { !$0.isToday })
    }

    private func setup() {
        backgroundColor = Color.gray

        setupStackView()
        setupHeadlineLabel()
        setupMaxTemperatureLabel()
        setupMinTemperatureLabel()
        setupWeatherConditions()
        setupNextDaysForecast()
    }

    private func setupStackView() {
        addSubview(stackView)

        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Constants.margin),
            stackView.bottomAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor, constant: -Constants.margin),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Constants.margin),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -Constants.margin)
        ])
    }

    private func setupHeadlineLabel() {
        stackView.addArrangedSubview(headlineLabel)

        headlineLabel.textColor = .black
        headlineLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        headlineLabel.numberOfLines = 0
        headlineLabel.textAlignment = .center
    }

    private func setupMaxTemperatureLabel() {
        stackView.addArrangedSubview(maxTemperatureLabel)

        maxTemperatureLabel.font = UIFont.systemFont(ofSize: 48, weight: .heavy)
        maxTemperatureLabel.numberOfLines = 0
        maxTemperatureLabel.textAlignment = .center
    }

    private func setupMinTemperatureLabel() {
        stackView.addArrangedSubview(minTemperatureLabel)

        minTemperatureLabel.numberOfLines = 0
        minTemperatureLabel.textAlignment = .center
    }

    private func setupWeatherConditions() {
        stackView.addArrangedSubview(weatherConditions)

        weatherConditions.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            weatherConditions.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: Constants.margin),
            weatherConditions.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -Constants.margin)
        ])
    }

    private func setupNextDaysForecast() {
        stackView.addArrangedSubview(nextDaysForecast)

        nextDaysForecast.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nextDaysForecast.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: Constants.margin),
            nextDaysForecast.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -Constants.margin)
        ])
    }

    private func buildAttributedText(forecast: DailyForecast) -> NSAttributedString {
        let minimumTemperature = NSMutableAttributedString(
            string: Strings.minimumTemperature,
            attributes: [
                .font: UIFont.systemFont(ofSize: 20, weight: .bold),
                .foregroundColor: UIColor.black
            ])
        let temperature = NSAttributedString(
            string: forecast.minimumTemperature,
            attributes: [
                .font: UIFont.systemFont(ofSize: 20, weight: .bold),
                .foregroundColor: forecast.minimumTemperatureColor
            ])
        minimumTemperature.append(temperature)
        return minimumTemperature
    }

}
