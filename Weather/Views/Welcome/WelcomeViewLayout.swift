//
//  WelcomeViewLayout.swift
//

import UIKit

final class WelcomeViewLayout: UIView {
    private enum Constants {
        static let margin: CGFloat = 16.0
        static let lineSpacing: CGFloat = 8.0
    }

    init() {
        super.init(frame: .zero)

        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var textDidChange: ((String?) -> Void)? {
        didSet {
            searchInput.textDidChange = textDidChange
        }
    }

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .clear
        collectionView.register(CityCell.self, forCellWithReuseIdentifier: CityCell.reuseIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    let searchInput = SearchInput()
    let searchHistory = SearchHistory()

    private var flowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = Constants.lineSpacing
        return flowLayout
    }()

    private let stackView = UIStackView()
    private let collectionHeaderLabel = UILabel()

    private func setup() {
        backgroundColor = Color.gray

        setupSearchInput()
        setupStackView()
        setupSearchHistory()
        setupCollectionHeaderLabel()
        setupCollectionView()
    }

    private func setupSearchInput() {
        addSubview(searchInput)

        searchInput.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            searchInput.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Constants.margin),
            searchInput.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.margin),
            searchInput.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.margin)
        ])
    }

    private func setupStackView() {
        addSubview(stackView)

        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: searchInput.bottomAnchor, constant: Constants.margin),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.margin),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.margin),
        ])
    }

    private func setupSearchHistory() {
        stackView.addArrangedSubview(searchHistory)

        searchHistory.isHidden = true
        searchHistory.isUserInteractionEnabled = true
    }

    private func setupCollectionHeaderLabel() {
        stackView.addArrangedSubview(collectionHeaderLabel)

        collectionHeaderLabel.textColor = .black
        collectionHeaderLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        collectionHeaderLabel.text = Strings.searchTitle
        collectionHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupCollectionView() {
        stackView.addArrangedSubview(collectionView)
    }
}
