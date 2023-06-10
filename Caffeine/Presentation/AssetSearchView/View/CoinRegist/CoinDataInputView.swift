//
//  CoinDataInputView.swift
//  Caffeine
//
//  Created by 김상진 on 2023/06/10.
//

import SwiftUI

struct CoinDataInputView: View {
    
    var crypto: Crypto
    @Binding var amount: String
    @Binding var avgPrice: String
    
    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: crypto.image)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 30, height: 30)
                Text(crypto.name)
                    .foregroundColor(.white)
                Spacer(minLength: 50)
                VStack(alignment: .trailing) {
                    TextField("", text: $amount)
                        .placeholder(when: amount.isEmpty, alignment: .trailing, placeholder: {
                            Text("0")
                                .foregroundColor(.white)
                                .opacity(0.5)
                        })
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(.white)
                    Text("개")
                        .foregroundColor(.white)
                        .font(.system(size: 12))
                }
            }
            HStack {
                Image(systemName: "wonsign")
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                Text("평단가")
                    .foregroundColor(.white)
                Spacer(minLength: 50)
                VStack(alignment: .trailing) {
                    TextField("", text: $avgPrice)
                        .placeholder(when: avgPrice.isEmpty, alignment: .trailing, placeholder: {
                            Text("0")
                                .foregroundColor(.white)
                                .opacity(0.5)
                        })
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(.white)
                    Text("원")
                        .foregroundColor(.white)
                        .font(.system(size: 12))
                }
            }
        }
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
        .background(.gray)
        .cornerRadius(20)
        .padding()
    }
}

struct CoinDataInputView_Previews: PreviewProvider {
    static var previews: some View {
        CoinDataInputView(crypto: Crypto(id: "", name: "bitcoin", image: "", currentPrice: 2000), amount: .constant("10"), avgPrice: .constant("3100000"))
    }
}
