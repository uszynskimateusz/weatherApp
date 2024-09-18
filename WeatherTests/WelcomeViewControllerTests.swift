//
//  WelcomeViewControllerTests.swift
//

import XCTest
import SnapshotTesting
@testable import Weather

final class WelcomeViewControllerTests: XCTestCase {

    func testWelcomeView() throws {
        let autocompleteCitiesService = AutocompleteCitiesServiceMock(cities: [])
        let persistenceMock = PersistenceMock<SearchCity>()
        let welcomeViewModel = WelcomeViewModel(
            delegate: WelcomeViewModelDelegateMock(),
            autocompleteCitiesService: autocompleteCitiesService,
            persistence: persistenceMock
        )
        welcomeViewModel.cities = [
            AutocompleteCity(localizedName: "Wadżdza", key: "1", rank: 1),
            AutocompleteCity(localizedName: "Warszawa", key: "2", rank: 2)
        ]
        let sut = WelcomeViewController(viewModel: welcomeViewModel)
        sut.viewDidLoad()

        assertSnapshot(of: sut, as: .image(on: .iPhone13ProMax))
    }
}
