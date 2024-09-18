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
    }

    private func setup() {
        backgroundColor = Color.gray

        setupStackView()
        setupHeadlineLabel()
        setupMaxTemperatureLabel()
        setupMinTemperatureLabel()
    }

    private func setupStackView() {
        addSubview(stackView)

        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Constants.margin),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -Constants.margin),
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

        maxTemperatureLabel.font = UIFont.systemFont(ofSize: 32, weight: .heavy)
        maxTemperatureLabel.numberOfLines = 0
        maxTemperatureLabel.textAlignment = .center
    }

    private func setupMinTemperatureLabel() {
        stackView.addArrangedSubview(minTemperatureLabel)

        minTemperatureLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        minTemperatureLabel.numberOfLines = 0
        minTemperatureLabel.textAlignment = .center
    }
}
