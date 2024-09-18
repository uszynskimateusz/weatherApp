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
    private let minTemperatureLabel = UILabel()
    private let nextDaysLabel = UILabel()
    private let nextDaysStackView = UIStackView()

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
            minTemperatureLabel.textColor = todayForecast.minimumTemperatureColor
            minTemperatureLabel.text = todayForecast.minimumTemperature
        }

        forecast.dailyForecasts.filter { !$0.isToday }.forEach { day in
            let dayForecast = DayForecast()
            dayForecast.configure(temperature: day.maximumTemperature, date: day.formattedDateValue)
            nextDaysStackView.addArrangedSubview(dayForecast)
        }
    }

    private func setup() {
        backgroundColor = Color.gray

        setupStackView()
        setupHeadlineLabel()
        setupMaxTemperatureLabel()
        setupMinTemperatureLabel()
        setupNextDaysLabel()
        setupNextDaysStackView()
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

        minTemperatureLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        minTemperatureLabel.numberOfLines = 0
        minTemperatureLabel.textAlignment = .center
    }

    private func setupNextDaysLabel() {
        stackView.addArrangedSubview(nextDaysLabel)

        nextDaysLabel.text = Strings.nextDays
        nextDaysLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        nextDaysLabel.numberOfLines = 0
        nextDaysLabel.textAlignment = .center
    }

    private func setupNextDaysStackView() {
        stackView.addArrangedSubview(nextDaysStackView)

        nextDaysStackView.translatesAutoresizingMaskIntoConstraints = false
        nextDaysStackView.distribution = .fillEqually
        nextDaysStackView.alignment = .center

        NSLayoutConstraint.activate([
            nextDaysStackView.heightAnchor.constraint(equalToConstant: 50),
            nextDaysStackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: Constants.margin),
            nextDaysStackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -Constants.margin)
        ])
    }
}
