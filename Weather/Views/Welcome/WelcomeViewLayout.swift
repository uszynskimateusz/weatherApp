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

    private var flowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = Constants.lineSpacing
        return flowLayout
    }()

    private func setup() {
        backgroundColor = Color.gray

        setupSearchInput()
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

    private func setupCollectionView() {
        addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: searchInput.bottomAnchor, constant: Constants.margin),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.margin),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.margin)
        ])
    }
}
