//
//  WelcomeCoordinator.swift
//

import UIKit

class WelcomeCoordinator: BaseCoordinator {
    override func start() {
        let httpClient = HttpClient()
        let autocompleteCitiesService = AutocompleteCitiesService(httpClient: httpClient)
        let viewModel = WelcomeViewModel(autocompleteCitiesService: autocompleteCitiesService)
        let welcomeViewController = WelcomeViewController(viewModel: viewModel)
        navigationController.setViewControllers([welcomeViewController], animated: false)
    }
}
