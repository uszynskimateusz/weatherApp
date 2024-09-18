//
//  PersistenceMock.swift
//

@testable import Weather

final class PersistenceMock<Object: Codable>: PersistenceProtocol {
    private var objects: [Object] = []

    func setObjects<T>(array: [T], forKey key: String) where T : Decodable, T : Encodable {
        objects = array.compactMap { $0 as? Object }
    }
    
    func getObjects<T>(forKey key: String) -> [T]? where T : Decodable, T : Encodable {
        objects.compactMap { $0 as? T }
    }

}
