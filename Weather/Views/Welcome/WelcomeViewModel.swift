//
//  WelcomeViewModel.swift
//

import Foundation

protocol WelcomeViewModelDelegate: AnyObject {
    func showCityDetails(_ city: AutocompleteCity)
}

protocol WelcomeViewModelProtocol {
    var cities: [AutocompleteCity] { get set }
    var onUpdate: (() -> Void)? { get set }

    var history: [SearchCity] { get set }
    var onHistoryUpdate: (() -> Void)? { get set }

    func viewDidLoad()
    func isValid(_ text: String) -> Bool
    func search(_ city: String?)
    func didSelectCity(city: AutocompleteCity?)
}

final class WelcomeViewModel {
    var onHistoryUpdate: (() -> Void)?
    var onUpdate: (() -> Void)?
    var cities: [AutocompleteCity] = [] {
        didSet {
            onUpdate?()
        }
    }
    var history: [SearchCity] = [] {
        didSet {
            onHistoryUpdate?()
        }
    }

    private weak var delegate: WelcomeViewModelDelegate?

    private let autocompleteCitiesService: AutocompleteCitiesServiceProtocol
    private let persistence: PersistenceProtocol

    init(
        delegate: WelcomeViewModelDelegate,
        autocompleteCitiesService: AutocompleteCitiesServiceProtocol,
        persistence: PersistenceProtocol
    ) {
        self.delegate = delegate
        self.autocompleteCitiesService = autocompleteCitiesService
        self.persistence = persistence
    }

    private func getHistorySearch() {
        let searchCities: [SearchCity] = persistence.getObjects(forKey: "historySearch") ?? []
        history = searchCities.sorted(by: { $0.date > $1.date })
    }

    private func setHistorySearch() {
        let array = Array(history.prefix(5))
        persistence.setObjects(array: array, forKey: "historySearch")
    }
}

extension WelcomeViewModel: WelcomeViewModelProtocol {
    func viewDidLoad() {
        getHistorySearch()
    }

    func search(_ city: String?) {
        guard let city, !city.isEmpty else {
            cities = []
            return
        }

        Task {
            do {
                self.cities = try await autocompleteCitiesService.fetchAutocompleteCities(city: city)
            } catch {
                print(error)
            }
        }
    }
    
    func isValid(_ text: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", AppConstants.cityRegex)
        return predicate.evaluate(with: text)
    }

    func didSelectCity(city: AutocompleteCity?) {
        guard let city else { return }

        if !history.contains(where: { $0.city == city }) {
            history.insert(SearchCity(city: city, date: Date()), at: 0)
            setHistorySearch()
        }
        
        delegate?.showCityDetails(city)
    }
}
