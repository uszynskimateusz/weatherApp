//
//  CityDetailsViewControllerTests.swift
//

import XCTest
import SnapshotTesting
@testable import Weather

final class CityDetailsViewControllerTests: XCTestCase {

    func testCityDetailsView() async throws {
        let forecastService = ForecastServiceMock()
        let viewModel = CityDetailsViewModel(
            autocompleteCity: AutocompleteCity(localizedName: "Warszawa", key: "1", rank: 1),
            forecastService: forecastService)
        let forecast = try await forecastService.fetchForecast(cityKey: "1")
        let sut = await CityDetailsViewController(viewModel: viewModel)
        await sut.viewDidLoad()
        viewModel.onUpdateForecast?(forecast)

        DispatchQueue.main.async {
            assertSnapshot(of: sut, as: .image(on: .iPhone13ProMax))
        }
    }
}
