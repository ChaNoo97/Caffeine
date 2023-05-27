//
//  AssetSearchView.swift
//  Caffeine
//
//  Created by Hoo's MacBookPro on 2023/05/13.
//

import SwiftUI
import ComposableArchitecture
import Combine

struct AssetSearchView: View {
    
    @State var offset: CGFloat = 0
    @State var keyword: String = ""
    var screenSize: CGSize
    @State var coinList: [Crypto] = []
    
    let store: StoreOf<AssetSearch>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                Spacer().frame(height: 50)
                SearchBarView(keyword: $keyword)

                Spacer().frame(height: 20)
                PagerTapView(tint: .black) {
                    Text("주식")
                        .pageLabel()
                    Text("코인")
                        .pageLabel()
                    Text("부동산")
                        .pageLabel()
                } content: {
                    List {
                        Text("FirstTab")
                    }
                    .pageView()
                    
                    CryptoList(list: $coinList)
                    .pageView()
                    .onAppear {
                        viewStore.send(.refreshCoinList)
                    }
                    
                    List {
                        Text("ThirdTab")
                    }
                    .pageView()
                }
            }
            .onReceive(Just(viewStore.state.coinList)) { list in
                // 하위 뷰가 UIRrepresentable로 구성된 scrollView가 최신화되지 않는 이슈가 있음
                // 데이터를 하나 새로만들어서 @Binding으로 연결해주면 해결이 됨.
                coinList = list
            }
        }
        
    }
}

struct AssetSearchView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
