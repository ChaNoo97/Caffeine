//
//  SearchBarView.swift
//  Caffeine
//
//  Created by 김상진 on 2023/05/19.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var keyword: String
    
    var body: some View {
        HStack {
            TextField("주식, 코인 검색", text: $keyword)
                .frame(height: 40)
                .padding([.leading, .trailing])
                .background(.gray.opacity(0.2))
                .cornerRadius(20)
                .padding(.leading)
            Button {
                keyword = ""
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.gray)
            }
            .frame(width: 40, height: 40)
            Spacer()
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(keyword: .constant("ray"))
    }
}
