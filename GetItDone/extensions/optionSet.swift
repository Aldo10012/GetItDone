//
//  optionSet.swift
//  GetItDone
//
//  Created by Alberto Dominguez on 3/29/21.
//

import Foundation

struct ButtonOptions: OptionSet {
    let rawValue: Int

    static let roundedtext = ButtonOptions(rawValue: 1 << 0)
    static let squareIcon  = ButtonOptions(rawValue: 1 << 1)
    static let squareText  = ButtonOptions(rawValue: 1 << 2)
    
    static let todoMain       = ButtonOptions(rawValue: 1 << 3)
    static let dateSelected   = ButtonOptions(rawValue: 1 << 4)
    static let dateUnselected = ButtonOptions(rawValue: 1 << 5)
}
