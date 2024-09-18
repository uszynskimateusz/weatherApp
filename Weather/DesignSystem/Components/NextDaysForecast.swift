//
//  NextDaysForecast.swift
//

import UIKit

final class NextDaysForecast: UIView {
    private enum Constants {
        static let margin: CGFloat = 8.0
    }
    
    init() {
        super.init(frame: .zero)

        setup()
    }

    private let nextDaysLabel = UILabel()
    private let nextDaysStackView = UIStackView()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with dailyForecasts: [DailyForecast]) {
        dailyForecasts.forEach { day in
            let dayForecast = DayForecast()
            dayForecast.configure(temperature: day.maximumTemperature, date: day.formattedDateValue)
            nextDaysStackView.addArrangedSubview(dayForecast)
        }
    }

    private func setup() {
        setupNextDaysLabel()
        setupNextDaysStackView()
    }

    private func setupNextDaysLabel() {
        addSubview(nextDaysLabel)

        nextDaysLabel.text = Strings.nextDays
        nextDaysLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        nextDaysLabel.numberOfLines = 0
        nextDaysLabel.textAlignment = .center
        nextDaysLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nextDaysLabel.topAnchor.constraint(equalTo: topAnchor),
            nextDaysLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nextDaysLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    private func setupNextDaysStackView() {
        addSubview(nextDaysStackView)

        nextDaysStackView.translatesAutoresizingMaskIntoConstraints = false
        nextDaysStackView.distribution = .fillEqually
        nextDaysStackView.alignment = .center

        NSLayoutConstraint.activate([
            nextDaysStackView.topAnchor.constraint(equalTo: nextDaysLabel.bottomAnchor, constant: Constants.margin),
            nextDaysStackView.heightAnchor.constraint(equalToConstant: 50),
            nextDaysStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            nextDaysStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            nextDaysStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
