//
//  AssetSearch.swift
//  Caffeine
//
//  Created by 김상진 on 2023/05/26.
//

import Foundation
import ComposableArchitecture

struct AssetSearch: ReducerProtocol {
    struct State: Equatable {
        var coinList: [Crypto] = []
    }
    
    enum Action: Equatable {
        case refreshCoinList
        case refreshCoinResponse(Result<[CryptoResModel], RequestError>)
    }
    
    @Dependency(\.caffeineService) var caffeineService
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .refreshCoinList:
            return .run { send in
                await send(
                    .refreshCoinResponse(await caffeineService.getCrypto())
                )
            }
        case let .refreshCoinResponse(result):
            switch result {
            case .success(let response):
                state.coinList = convertToCrypto(from: response)
            case .failure(let failure):
                print(failure)
            }
            return .none
        }
    }
    
    // 이런 변환 과정은 어디서 해주는게 좋을까?
    func convertToCrypto(from: [CryptoResModel]) -> [Crypto] {
        return from.map { Crypto(id: $0.id, name: $0.name, image: $0.image, currentPrice: $0.currentPrice) }
    }
}
