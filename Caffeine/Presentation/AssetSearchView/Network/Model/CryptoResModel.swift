//
//  CryptoResModel.swift
//  Caffeine
//
//  Created by 김상진 on 2023/05/24.
//

import Foundation

struct CryptoResModel: Codable, Equatable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let priceChange24H: Double
    let priceChangePercentage24H: Double
    let lastUpdated: String

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case lastUpdated = "last_updated"
    }
    
    func convertToCrypto() -> Crypto {
        return Crypto(id: id, name: name, image: image, currentPrice: currentPrice)
    }
}
