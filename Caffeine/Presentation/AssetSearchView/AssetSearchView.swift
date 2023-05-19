//
//  AssetSearchView.swift
//  Caffeine
//
//  Created by Hoo's MacBookPro on 2023/05/13.
//

import SwiftUI

struct AssetSearchView: View {
    
    @State var keyword: String
    
    var body: some View {
        VStack {
            Spacer().frame(height: 50)
            SearchBarView(keyword: $keyword)
            
            List {
                Text("Hellow World")
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
        }
    }
}

struct AssetSearchView_Previews: PreviewProvider {
    static var previews: some View {
        AssetSearchView(keyword: "")
    }
}
