//
//  Dependency+Extension.swift
//  Caffeine
//
//  Created by 김상진 on 2023/05/27.
//

import Foundation
import ComposableArchitecture

extension CaffeineService: DependencyKey {
    static let liveValue = CaffeineService.shared
}

extension DependencyValues {
    var caffeineService: CaffeineService {
        get { self[CaffeineService.self] }
        set { self[CaffeineService.self] = newValue }
    }
}
