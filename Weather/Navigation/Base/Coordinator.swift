//
//  Coordinator.swift
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    var parentCoordinator: Coordinator? { get set }

    func start()
    func start(coordinator: Coordinator)
    func didFinish(coordinator: Coordinator)
    func removeChildCoordinators()
}
