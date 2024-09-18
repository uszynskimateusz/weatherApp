//
//  CityDetailsBuilder.swift
//

import UIKit

enum CityDetailsBuilder {
    static func build(autocompleteCity: AutocompleteCity) -> UIViewController {
        let httpClient = HttpClient()
        let forecastService = ForecastService(httpClient: httpClient)
        let viewModel = CityDetailsViewModel(autocompleteCity: autocompleteCity, forecastService: forecastService)
        let cityDetailsViewController = CityDetailsViewController(viewModel: viewModel)
        return cityDetailsViewController
    }
}
