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
                state.coinList = response.map { $0.convertToCrypto() }
            case .failure(let failure):
                print(failure)
                state.coinList = getDummyCryptos()
            }
            return .none
        }
    }
    
    func getDummyCryptos() -> [Crypto] {
        return [
            Crypto(id: "1", name: "비트코인", image: "", currentPrice: 20000),
            Crypto(id: "2", name: "이더리움", image: "", currentPrice: 30000),
            Crypto(id: "3", name: "리플", image: "", currentPrice: 40000),
            Crypto(id: "4", name: "에이다", image: "", currentPrice: 50000),
            Crypto(id: "5", name: "솔라나", image: "", currentPrice: 60000),
        ]
    }
}
