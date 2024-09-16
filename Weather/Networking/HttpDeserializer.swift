//
//  HttpDeserializer.swift
//

import UIKit

final class HttpDeserializer {
    let decoder: JSONDecoder

    init (decoder: JSONDecoder = JSONDecoder()) {
        self.decoder = decoder
    }

    func deserialize<T: Decodable>(
        responseStatus: Int,
        data: Data
    ) throws -> T {
        guard responseStatus != 401 else { throw HttpError.authorization }

        if 200...399 ~= responseStatus {
            do {
                let model: T = try decoder.decode(T.self, from: data)
                return model
            } catch {
                throw HttpError.responseSerializationError(error)
            }
        } else {
            throw HttpError.serverError
        }
    }
}

