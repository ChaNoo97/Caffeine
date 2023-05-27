//
//  Crypto.swift
//  Caffeine
//
//  Created by 김상진 on 2023/05/27.
//

import Foundation

struct Crypto: Identifiable, Hashable {
    let id: String
    let name: String
    let image: String
    let currentPrice: Double
    
    init(id: String, name: String, image: String, currentPrice: Double) {
        self.id = id
        self.name = name
        self.image = image
        self.currentPrice = currentPrice
    }
}
