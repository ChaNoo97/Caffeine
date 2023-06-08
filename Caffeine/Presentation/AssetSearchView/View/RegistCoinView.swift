//
//  RegistCoinView.swift
//  Caffeine
//
//  Created by 김상진 on 2023/05/30.
//

import SwiftUI

struct RegistCoinView: View {
    let crypto: Crypto
    var body: some View {
        Text("\(crypto.name)")
    }
}

//struct RegistCoinView_Previews: PreviewProvider {
//    static var previews: some View {
//        RegistCoinView()
//    }
//}
