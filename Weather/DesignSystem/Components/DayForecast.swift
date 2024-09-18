//
//  DayForecast.swift
//

import UIKit

final class DayForecast: UIView {
    init() {
        super.init(frame: .zero)

        setup()
    }

    private let temperatureLabel = UILabel()
    private let dateLabel = UILabel()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(temperature: String, date: String) {
        temperatureLabel.text = temperature
        dateLabel.text = date
    }

    private func setup() {
        setupTemperatureLabel()
        setupDateLabel()
    }

    private func setupTemperatureLabel() {
        addSubview(temperatureLabel)

        temperatureLabel.textColor = .black
        temperatureLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        temperatureLabel.textAlignment = .center
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            temperatureLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            temperatureLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            temperatureLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }

    private func setupDateLabel() {
        addSubview(dateLabel)

        dateLabel.textColor = .black
        dateLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        dateLabel.textAlignment = .center
        dateLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 8),
            dateLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
