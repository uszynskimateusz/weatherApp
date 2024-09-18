//
//  WelcomeViewController.swift
//

import UIKit

final class WelcomeViewController: UIViewController {
    init(viewModel: WelcomeViewModelProtocol) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = layout
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTitle()
        setupLayout()
        bindViewModel()
    }

    private let layout = WelcomeViewLayout()
    private var viewModel: WelcomeViewModelProtocol

    private func setupTitle() {
        title = Strings.welcomeTitle
    }

    private func setupLayout() {
        layout.searchInput.textFieldDelegate = self

        layout.collectionView.delegate = self
        layout.collectionView.dataSource = self

        layout.textDidChange = { [weak self] city in
            self?.viewModel.search(city)
        }

        layout.searchHistory.onTap = { [weak self] city in
            self?.viewModel.didSelectCity(city: city)
        }
    }

    private func bindViewModel() {
        viewModel.onUpdate = { [weak self] in
            guard let self else { return }

            DispatchQueue.main.async {
                self.layout.collectionView.reloadData()
            }
        }

        viewModel.onHistoryUpdate = { [weak self] in
            guard let self else { return }

            DispatchQueue.main.async {
                self.layout.searchHistory.configure(with: Array(self.viewModel.history.prefix(5)))
                self.layout.searchHistory.isHidden = self.viewModel.history.isEmpty
            }
        }

        viewModel.viewDidLoad()
    }
}

extension WelcomeViewController: UITextFieldDelegate {
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        return viewModel.isValid(string)
    }
}

extension WelcomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return viewModel.cities.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CityCell.reuseIdentifier, for: indexPath) as! CityCell
        cell.configure(viewModel.cities[indexPath.row].localizedName)
        return cell
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(width: layout.collectionView.frame.width,
               height: 48.0)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        viewModel.didSelectCity(city: viewModel.cities[indexPath.row])
    }
}
