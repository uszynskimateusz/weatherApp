//
//  HttpClient.swift
//

import UIKit

public protocol HttpClientProtocol {
    func request<ResponseData: Decodable>(route: any HttpEndpointProtocol) async throws -> ResponseData
}

public final class HttpClient: HttpClientProtocol {
    private let urlSession: URLSessionProtocol
    private let httpDeserializer: HttpDeserializer

    public init(urlSession: URLSessionProtocol = URLSession.shared) {
        self.urlSession = urlSession
        self.httpDeserializer = HttpDeserializer()
    }

    public func request<T: Decodable>(route: any HttpEndpointProtocol) async throws -> T {
        do {
            return try await perform(route)
        } catch {
            throw error
        }
    }

    private func perform<T: Decodable>(_ endpoint: any HttpEndpointProtocol) async throws -> T {
        do {
            let urlRequest = endpoint.asUrlRequest()
            let (data, response) = try await urlSession.data(for: urlRequest)

            guard let response = response as? HTTPURLResponse else {
                throw HttpError.unknown(NSError(
                    domain: "",
                    code: 400,
                    userInfo: [ NSLocalizedDescriptionKey: "Unknown error"]
                ))
            }

            return try httpDeserializer.deserialize(
                responseStatus: response.statusCode,
                data: data
            )
        } catch {
            if let urlError = error as? URLError {
                throw HttpError.unknown(urlError)
            } else if let error = error as? AnyHttpErrorProtocol {
                throw error
            } else {
                throw HttpError.unknown(error)
            }
        }
    }

}
