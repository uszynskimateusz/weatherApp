//
//  CityDetailsViewModel.swift
//

import Foundation

protocol CityDetailsViewModelProtocol {
    var title: String { get }
    var onUpdateForecast: ((Forecast?) -> Void)? { get set }
}

final class CityDetailsViewModel {
    var onUpdateForecast: ((Forecast?) -> Void)?

    private var forecast: Forecast? {
        didSet {
            onUpdateForecast?(forecast)
        }
    }

    private let autocompleteCity: AutocompleteCity
    private let forecastService: ForecastServiceProtocol

    init(
        autocompleteCity: AutocompleteCity,
        forecastService: ForecastServiceProtocol
    ) {
        self.autocompleteCity = autocompleteCity
        self.forecastService = forecastService

        getDailyForecast()
    }

    private func getDailyForecast() {
        Task {
            do {
                forecast = try await forecastService.fetchForecast(cityKey: autocompleteCity.key)
            } catch {
                print(error)
            }
        }
    }
}

extension CityDetailsViewModel: CityDetailsViewModelProtocol {
    var title: String {
        autocompleteCity.localizedName
    }
}
