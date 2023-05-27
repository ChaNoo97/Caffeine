//
//  CaffeineService.swift
//  Caffeine
//
//  Created by 김상진 on 2023/05/24.
//

import Foundation

protocol CaffeineServicable {
    func getCrypto() async -> Result<[CryptoResModel], RequestError>
}

class CaffeineService: CaffeineServicable, HTTPClient {
    
    static let shared = CaffeineService()
    private init() {}
    
    func getCrypto() async -> Result<[CryptoResModel], RequestError> {
        return await request(endpoint: CaffeineEndPoint.crypto, responseModel: [CryptoResModel].self)
    }
}
