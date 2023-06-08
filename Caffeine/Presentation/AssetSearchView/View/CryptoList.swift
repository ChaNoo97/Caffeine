//
//  CryptoList.swift
//  Caffeine
//
//  Created by 김상진 on 2023/05/27.
//

import SwiftUI

struct CryptoList: View {
    @Binding var list: [Crypto]
 
    var body: some View {
        List {
            ForEach(list, id: \.self) { coin in
                NavigationLink(destination: RegistCoinView(crypto: coin)) {
                    HStack {
                        AsyncImage(url: URL(string: coin.image)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 30, height: 30)
                        Text("\(coin.name)")
                    }
                }
            }
        }
        .listStyle(.plain)
    }
}

//struct CryptoList_Previews: PreviewProvider {
//    static var previews: some View {
//        CryptoList(list: .constant([]))
//    }
//}
