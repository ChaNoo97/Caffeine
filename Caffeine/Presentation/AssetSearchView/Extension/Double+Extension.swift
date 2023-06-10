//
//  Double+Extension.swift
//  Caffeine
//
//  Created by 김상진 on 2023/06/10.
//

import Foundation

extension Double {
    func krwFormat() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(from: NSNumber(value: self))!
    }
}
