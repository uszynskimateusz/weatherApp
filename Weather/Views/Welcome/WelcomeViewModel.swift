//
//  WelcomeViewModel.swift
//

import Foundation

protocol WelcomeViewModelProtocol {
    var cities: [AutocompleteCity] { get set }
    var onUpdate: (() -> Void)? { get set }

    func isValid(_ text: String) -> Bool
    func search(_ city: String?)
    func didSelectCity(index: Int)
}

final class WelcomeViewModel {
    var onUpdate: (() -> Void)?
    var cities: [AutocompleteCity] = [] {
        didSet {
            onUpdate?()
        }
    }

    private let httpClient: HttpClientProtocol

    init(httpClient: HttpClientProtocol) {
        self.httpClient = httpClient
    }
}

extension WelcomeViewModel: WelcomeViewModelProtocol {
    func search(_ city: String?) {
        guard let city, !city.isEmpty else {
            cities = []
            return
        }

        Task {
            do {
                let endpoint = AutocompleteSearchEndpoint(city: city)
                let autocompleteCities: [AutocompleteCity] = try await httpClient.request(route: endpoint)
                self.cities = autocompleteCities.sorted { $0.rank < $1.rank}
            } catch {
                print(error)
            }
        }
    }
    
    func isValid(_ text: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", AppConstants.cityRegex)
        return predicate.evaluate(with: text)
    }

    func didSelectCity(index: Int) {
        let city = cities[index]

        // TODO: Show second screen with city details
        print("Did select \(city.localizedName)")
    }
}
