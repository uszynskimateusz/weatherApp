//
//  PersistenceProtocol.swift
//

import Foundation

public protocol PersistenceProtocol {
    func setObjects<T: Codable>(array: [T], forKey key: String)
    func getObjects<T: Codable>(forKey key: String) -> [T]?
}

public final class Persistence: PersistenceProtocol {
    private let userData = UserDefaults.standard

    public init() {}

    public func setObjects<T>(array: [T], forKey key: String) where T : Codable {
        guard let encodedData = try? JSONEncoder().encode(array) else { return }

        userData.set(encodedData, forKey: key)
    }

    public func getObjects<T>(forKey key: String) -> [T]? where T : Codable {
        guard let data = userData.data(forKey: key) else { return nil }

        return try? JSONDecoder().decode([T].self,
                                         from: data)
    }
}
