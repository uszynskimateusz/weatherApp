//
//  BaseCoordinator.swift
//

import UIKit

class BaseCoordinator: Coordinator {
    var navigationController = UINavigationController()
    var childCoordinators = [Coordinator]()
    var parentCoordinator: Coordinator?

    func start() {
        fatalError("Start method should be implemented.")
    }

    func start(coordinator: Coordinator) {
        childCoordinators += [coordinator]
        coordinator.parentCoordinator = self
        coordinator.start()
    }

    func removeChildCoordinators() {
        childCoordinators.forEach { $0.removeChildCoordinators() }
        childCoordinators.removeAll()
    }

    func didFinish(coordinator: Coordinator) {
        guard let index = childCoordinators.firstIndex(where: { $0 === coordinator }) else { return }

        childCoordinators.remove(at: index)
    }
}
