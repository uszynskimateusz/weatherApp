//
//  CityCell.swift
//

import UIKit

class CityCell: UICollectionViewCell {
    static let reuseIdentifier = "CityCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let cityLabel = UILabel()

    func configure(_ city: String) {
        cityLabel.text = city
    }

    private func setup() {
        setupLabel()
    }

    private func setupLabel() {
        addSubview(cityLabel)

        cityLabel.textColor = .black
        cityLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)

        cityLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            cityLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            cityLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            cityLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
