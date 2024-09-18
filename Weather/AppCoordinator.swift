//
//  AppCoordinator.swift
//

import UIKit

class AppCoordinator: BaseCoordinator {
    private var window: UIWindow?

    init(window: UIWindow?) {
        self.window = window
    }

    override func start() {
        showWelcomeScreen()
    }

    private func showWelcomeScreen() {
        removeChildCoordinators()

        let coordinator = WelcomeCoordinator()
        let navigationController = UINavigationController()
        navigationController.navigationBar.prefersLargeTitles = true
        coordinator.navigationController = navigationController
        start(coordinator: coordinator)

        navigationController.loadViewIfNeeded()

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
