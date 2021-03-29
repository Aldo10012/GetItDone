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
}
