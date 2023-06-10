//
//  KeypadView.swift
//  Caffeine
//
//  Created by 김상진 on 2023/06/10.
//

import SwiftUI

enum InputButton: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case dot = "."
    case zero = "0"
    case delete = "delete"
}

struct KeypadView: View {
    
    @Binding var value: String
    @Binding var selectedField: CoinInputFieldType
    
    let buttons: [[InputButton]] = [
        [.one, .two, .three],
        [.four, .five, .six],
        [.seven, .eight, .nine],
        [.dot, .zero, .delete]
    ]
    
    var body: some View {
        VStack {
            ForEach(buttons, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { item in
                        Button {
                            self.didTap(item: item)
                            print(self.value)
                        } label: {
                            if item.rawValue == "delete" {
                                Image(systemName: "delete.left")
                                    .foregroundColor(.black)
                                    .frame(width: buttonWidth(), height: 70)
                            } else {
                                Text(item.rawValue)
                                    .frame(width: buttonWidth(), height: 70)
                                    .foregroundColor(.black)
                                    .font(.system(size: 20))
                                    .fontWeight(Font.Weight.semibold)
                            }
                            
                        }
                        
                    }
                }
            }
        }
    }
    
    func didTap(item: InputButton) {
        switch item {
        case .delete:
            _ = self.value.popLast()
        case .dot:
            let dot = item.rawValue
            self.value = "\(self.value)\(dot)"
        default:
            let number = item.rawValue
            if self.value == "0" {
                self.value = number
            } else {
                self.value = "\(self.value)\(number)"
            }
        }
    }
    
    func buttonWidth() -> CGFloat {
        return (UIScreen.main.bounds.width) / 3.5
    }
}

struct KeypadView_Previews: PreviewProvider {
    static var previews: some View {
        KeypadView(value: .constant("0"), selectedField: .constant(.none))
    }
}
