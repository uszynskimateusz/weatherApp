//
//  WeatherConditionView.swift
//

import UIKit

public enum WeatherCondition {
    case wind(String)
    case rain(String)
    case snow(String)

    var image: UIImage? {
        switch self {
        case .wind:
            Images.windIcon
        case .rain:
            Images.rainIcon
        case .snow:
            Images.snowIcon
        }
    }

    var value: String {
        switch self {
        case .wind(let value):
            value
        case .rain(let value):
            value
        case .snow(let value):
            value
        }
    }
}

final class WeatherConditionView: UIView {
    private let imageView = UIImageView()
    private let label = UILabel()
    private let weatherCondition: WeatherCondition

    init(weatherCondition: WeatherCondition) {
        self.weatherCondition = weatherCondition
        super.init(frame: .zero)

        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        setupImageView()
        setupLabel()
    }

    private func setupImageView() {
        addSubview(imageView)

        imageView.image = weatherCondition.image
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 24.0),
            imageView.widthAnchor.constraint(equalToConstant: 24.0)
        ])
    }

    private func setupLabel() {
        addSubview(label)

        label.text = weatherCondition.value
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 12),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
