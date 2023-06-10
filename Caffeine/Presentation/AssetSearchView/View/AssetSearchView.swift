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
    
    @State var selectedTab: AssetSearchTab = .stock
    
    let store: StoreOf<AssetSearch>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationView {
                VStack {
                    Spacer().frame(height: 50)
                    SearchBarView(keyword: $keyword)

                    Spacer().frame(height: 20)
                    
                    PagerTapView(tint: .black, selected: $selectedTab) {
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
                .onChange(of: viewStore.state.coinList) { list in
                    coinList = list
                }
                .onChange(of: keyword) { keyword in
                    if keyword.isEmpty {
                        coinList = viewStore.state.coinList
                    } else {
                        coinList = viewStore.state.coinList.filter { $0.name.contains(keyword) }
                    }
                }
            }
        }
        
    }
}

struct AssetSearchView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
