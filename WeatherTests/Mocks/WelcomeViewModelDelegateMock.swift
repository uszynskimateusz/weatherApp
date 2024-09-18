//
//  WelcomeViewModelDelegateMock.swift
//

@testable import Weather

final class WelcomeViewModelDelegateMock: WelcomeViewModelDelegate {
    func showCityDetails(_ city: Weather.AutocompleteCity) {}
}
