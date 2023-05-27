//
//  CaffeineEndPoint.swift
//  Caffeine
//
//  Created by 김상진 on 2023/05/24.
//

enum CaffeineEndPoint {
    case stock
    case crypto
}

extension CaffeineEndPoint: Endpoint {
    var host: String {
        switch self {
        case .stock:
            // todo
            return ""
        case .crypto:
            return "api.coingecko.com"
        }
    }
    
    var path: String {
        switch self {
        case .stock:
            // todo
            return ""
        case .crypto:
            // 참고: https://www.coingecko.com/en/api/documentation
            return "/api/v3/coins/markets"
        }
    }
    
    var query: [String : String]? {
        switch self {
        case .stock:
            return nil
        case .crypto:
            // todo
            return [
                "vs_currency": "krw",
                "order": "market_cap_desc",
                "per_page": "50",
                "page": "1",
                "sparkline": "false",
                "locale": "en"
            ]
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .stock, .crypto:
            return .get
        }
    }
    
    var header: [String : String]? {
        switch self {
        case .stock, .crypto:
            return [
                "Content-Type": "application/json;charset=utf-8"
            ]
        }
    }
    
    var body: [String : String]? {
        switch self {
        case .stock, .crypto:
            return nil
        }
    }
}
