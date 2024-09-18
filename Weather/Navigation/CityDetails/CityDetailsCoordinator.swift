//
//  CityDetailsCoordinator.swift
//

class CityDetailsCoordinator: BaseCoordinator {
    init(autocompleteCity: AutocompleteCity) {
        self.autocompleteCity = autocompleteCity
    }

    private lazy var cityDetailsModule = CityDetailsBuilder.build(autocompleteCity: autocompleteCity)

    private let autocompleteCity: AutocompleteCity

    override func start() {
        navigationController.pushViewController(cityDetailsModule, animated: true)
    }
}
