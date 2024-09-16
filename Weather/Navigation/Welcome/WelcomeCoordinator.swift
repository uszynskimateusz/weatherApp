//
//  WelcomeCoordinator.swift
//

import UIKit

class WelcomeCoordinator: BaseCoordinator {
    override func start() {
        let welcomeViewController = WelcomeViewController()
        navigationController.setViewControllers([welcomeViewController], animated: false)
    }
}
