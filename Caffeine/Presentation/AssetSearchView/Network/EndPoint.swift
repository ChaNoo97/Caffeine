//
//  EndPoint.swift
//  Caffeine
//
//  Created by 김상진 on 2023/05/23.
//


protocol Endpoint {
    var scheme: String { get }
    var host: String  { get }
    var path: String { get }
    var method: RequestMethod { get }
    var query: [String: String]? { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
}

extension Endpoint {
    var scheme: String {
        return "https"
    }
}

enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
}

enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown

    var message: String {
        switch self {
        case .decode:
            return "Decode Error"
        case .invalidURL:
            return "Session expired"
        case .noResponse:
            return "noResponse"
        case .unauthorized:
            return "unauthorized"
        case .unexpectedStatusCode:
            return "unexpected"
        case .unknown:
            return "unknown"
        }
    }
}
