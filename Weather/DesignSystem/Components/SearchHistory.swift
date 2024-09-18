//
//  SearchHistory.swift
//

import UIKit

final class SearchHistory: UIView {
    private enum Constants {
        static let margin: CGFloat = 8.0
    }

    var onTap: ((AutocompleteCity) -> Void)?

    private let headerLabel = UILabel()
    private let citiesStackView = UIStackView()

    init() {
        super.init(frame: .zero)

        setup()
    }

    func configure(with cities: [SearchCity]) {
        for view in citiesStackView.arrangedSubviews {
            citiesStackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }

        cities.forEach { searchCity in
            let tapGesture = TapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
            tapGesture.city = searchCity.city
            let label = UILabel()
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
            label.text = searchCity.city.localizedName
            label.isUserInteractionEnabled = true
            label.addGestureRecognizer(tapGesture)
            citiesStackView.addArrangedSubview(label)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        setupHeaderLabel()
        setupCitiesStackView()
    }

    private func setupHeaderLabel() {
        addSubview(headerLabel)

        headerLabel.textColor = .black
        headerLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.text = Strings.historySearchTitle

        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    private func setupCitiesStackView() {
        addSubview(citiesStackView)

        citiesStackView.axis = .vertical
        citiesStackView.spacing = 12.0
        citiesStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            citiesStackView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 12),
            citiesStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            citiesStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            citiesStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    @objc private func handleTap(_ sender: TapGestureRecognizer) {
        guard let city = sender.city else { return }

        onTap?(city)
    }
}

class TapGestureRecognizer: UITapGestureRecognizer {
    var city: AutocompleteCity?
}
