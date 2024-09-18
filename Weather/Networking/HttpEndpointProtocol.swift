//
//  HttpEndpointProtocol.swift
//

import UIKit

public protocol HttpEndpointProtocol {
    var path: String { get }
    var method: HttpMethod { get }
    var queryParams: [String: Any] { get }
    var baseUrl: URL { get }
}

public extension HttpEndpointProtocol {
    var baseUrl: URL {
        AppConstants.baseUrl
    }

    var method: HttpMethod {
        .get
    }

    var queryParams: [String: Any] {
        [:]
    }

    var url: URL {
        guard let url = URL(string: path, relativeTo: baseUrl), 
              var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        else {
            fatalError("Could not resolve URL (invalid path: '\(path)')")
        }

        components.queryItems = queryItems
        guard let url = components.url else {
            fatalError("Could not resolve URL (invalid queryParams: '\(queryParams)')")
        }

        return url
    }
}

extension HttpEndpointProtocol {
    var queryItems: [URLQueryItem]? {
        guard !queryParams.isEmpty else { return nil }

        return queryParams
            .flatMap { (key, value) -> [URLQueryItem] in
                if let values = value as? [Any] {
                    return values
                        .compactMap { $0 as? CustomStringConvertible }
                        .map { URLQueryItem(name: key, value: $0.description) }
                } else if let printableValue = value as? CustomStringConvertible {
                    return [
                        URLQueryItem(name: key, value: printableValue.description)
                    ]
                }

                return []
            }
    }
}

extension HttpEndpointProtocol {
    func asUrlRequest() -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
}
