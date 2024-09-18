//
//  CityDetailsViewController.swift
//

import UIKit

final class CityDetailsViewController: UIViewController {
    init(viewModel: CityDetailsViewModelProtocol) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = layout
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    private let layout = CityDetailsViewLayout()
    private var viewModel: CityDetailsViewModelProtocol

    private func setup() {
        setupNavigationBar()
        bindViewModel()
    }

    private func setupNavigationBar() {
        title = viewModel.title
        let backButton = UIBarButtonItem(
            image: Images.chevronIcon,
            style: .plain,
            target: self,
            action: #selector(backButtonTapped)
        )
        backButton.tintColor = .black
        navigationItem.leftBarButtonItem = backButton
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func bindViewModel() {
        viewModel.onUpdateForecast = { [weak self] forecast in
            guard let self else { return }

            DispatchQueue.main.async {
                self.layout.configure(forecast)
            }
        }
    }
}
