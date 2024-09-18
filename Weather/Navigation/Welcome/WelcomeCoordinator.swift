//
//  WelcomeCoordinator.swift
//

import UIKit

class WelcomeCoordinator: BaseCoordinator {
    override func start() {
        let httpClient = HttpClient()
        let viewModel = WelcomeViewModel(httpClient: httpClient)
        let welcomeViewController = WelcomeViewController(viewModel: viewModel)
        navigationController.setViewControllers([welcomeViewController], animated: false)
    }
}
