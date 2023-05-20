//
//  AssetSearchView.swift
//  Caffeine
//
//  Created by Hoo's MacBookPro on 2023/05/13.
//

import SwiftUI

struct AssetSearchView: View {
    
    @State var offset: CGFloat = 0
    @State var keyword: String = ""
    var screenSize: CGSize
    
    var body: some View {
        VStack {
            Spacer().frame(height: 50)
            SearchBarView(keyword: $keyword)
            
            Spacer().frame(height: 30)
            
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
                List {
                    Text("SecondTab")
                }
                .pageView()
                List {
                    Text("ThirdTab")
                }
                .pageView()
            }
        }
    }
}

struct AssetSearchView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
