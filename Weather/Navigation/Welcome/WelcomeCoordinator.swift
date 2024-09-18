//
//  WelcomeCoordinator.swift
//

import UIKit

class WelcomeCoordinator: BaseCoordinator {
    override func start() {
        let httpClient = HttpClient()
        let autocompleteCitiesService = AutocompleteCitiesService(httpClient: httpClient)
        let persistence = Persistence()
        let viewModel = WelcomeViewModel(
            delegate: self,
            autocompleteCitiesService: autocompleteCitiesService,
            persistence: persistence
        )
        let welcomeViewController = WelcomeViewController(viewModel: viewModel)
        navigationController.setViewControllers([welcomeViewController], animated: false)
    }
}

extension WelcomeCoordinator: WelcomeViewModelDelegate {
    func showCityDetails(_ city: AutocompleteCity) {
        let cityDetailsCoordinator = CityDetailsCoordinator(autocompleteCity: city)
        cityDetailsCoordinator.navigationController = navigationController
        start(coordinator: cityDetailsCoordinator)
    }
}
