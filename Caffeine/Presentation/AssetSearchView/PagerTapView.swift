//
//  PagerHelper.swift
//  Caffeine
//
//  Created by 김상진 on 2023/05/20.
//

import SwiftUI

struct PagerTapView<Content: View, Label: View>: View {
    
    var content: Content
    var label: Label
    var tint: Color
    
    init(tint: Color,
         @ViewBuilder labels: @escaping ()->Label,
         @ViewBuilder content: @escaping ()->Content
    ) {
        self.content = content()
        self.label = labels()
        self.tint = tint
    }
    
    @State var offset: CGFloat = 0
    @State var maxTab: CGFloat = 0
    @State var tabOffset: CGFloat = 0
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                label
            }
            .overlay(
                HStack(spacing: 0) {
                    ForEach(0..<Int(maxTab), id: \.self) { index in
                        Rectangle()
                            .fill(Color.black.opacity(0.01))
                            .onTapGesture { // 탭 했을때 스크롤뷰 offset 변경
                                let newOffset = CGFloat(index) * getScreenBounds().width
                                self.offset = newOffset
                            }
                    }
                }
            )
            .foregroundColor(tint)
            
            // 탭바 하단 라인
            Capsule()
                .fill(tint)
                .frame(width: maxTab == 0 ? 0 : (getScreenBounds().width / maxTab),
                       height: 5)
                .padding(.top, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
                .offset(x: tabOffset)
            
            OffsetPageTabView(offset: $offset) {
                HStack(spacing: 0) {
                    content
                }
                .overlay(
                    // ScrollView의 frame 정보를 부모뷰에게 전달하기 위함. onPreferenceChange 에서 전달 받음
                    GeometryReader { proxy in
                        Color.clear
                            .preference(key: TabPreferenceKey.self, value: proxy.frame(in: .global))
                    }
                )
                .onPreferenceChange(TabPreferenceKey.self) { proxy in
                    // ScrollView frame 정보를 바탕으로 maxTab, tabOffset(탭 하단 라인의 offset) 계산
                    let maxWidth = proxy.width
                    let screenWidth = getScreenBounds().width
                    let maxTabs = (maxWidth / screenWidth).rounded()
                    self.maxTab = maxTabs
                    
                    let minX = -proxy.minX
                    let progress = minX / screenWidth // ex) 스크린화면 크기만큼 이동했을때 360 / 360 = 1
                    let tabOffset = progress * (screenWidth / maxTabs) // 1 * (360/3)
                    self.tabOffset = tabOffset
                }
            }
        }
    }
}

struct TabPreferenceKey: PreferenceKey {
    static var defaultValue: CGRect = .init()
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}

extension View {
    func pageLabel() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .center)
    }
    
    func pageView() -> some View {
        self
            .frame(width: getScreenBounds().width, alignment: .center)
    }
    
    func getScreenBounds() -> CGRect {
        return UIScreen.main.bounds
    }
}

//struct PagerHelper_Previews: PreviewProvider {
//    static var previews: some View {
//        PagerHelper()
//    }
//}
