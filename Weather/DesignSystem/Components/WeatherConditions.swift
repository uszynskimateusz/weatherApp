//
//  WeatherConditions.swift
//

import UIKit

final class WeatherConditions: UIView {
    private enum Constants {
        static let margin: CGFloat = 8.0
    }

    private let conditionsStackView = UIStackView()

    init() {
        super.init(frame: .zero)

        setup()
    }

    func configure(with conditions: [WeatherCondition]) {
        conditions.forEach { conditionsStackView.addArrangedSubview(WeatherConditionView(weatherCondition: $0)) }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        setupConditionsStackView()
    }

    private func setupConditionsStackView() {
        addSubview(conditionsStackView)

        conditionsStackView.spacing = 12.0
        conditionsStackView.distribution = .fillEqually
        conditionsStackView.alignment = .center
        conditionsStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            conditionsStackView.topAnchor.constraint(equalTo: topAnchor),
            conditionsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            conditionsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            conditionsStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
