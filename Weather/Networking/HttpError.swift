//
//  HttpError.swift
//

import Foundation

protocol AnyHttpErrorProtocol: Error {}

public enum HttpError: AnyHttpErrorProtocol {
    case authorization
    case serverError
    case responseSerializationError(_ error: Error?)
    case unknown(_ error: Error?)
}

extension HttpError : LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .authorization:
            return "Authorization error."
        case .serverError:
            return "Server error."
        case .responseSerializationError(let error):
            return "Serialization error: \(String(describing: error))."
        case .unknown(let error):
            return "Unknown error: \(String(describing: error))."
        }
    }
}
