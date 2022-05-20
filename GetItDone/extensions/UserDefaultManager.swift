//
//  UserDefaultStore.swift
//  GetItDone
//
//  Created by Alberto Dominguez on 5/19/22.
//

import Foundation

class UserDefaultManager {
    
    private let ud = UserDefaults.standard
    
    init() { }
    
    func setUserAsRegistered() {
        ud.set(true, forKey: UDKeys.userDidRefister.rawValue)
    }
    
    var userIsRegistered: Bool {
        return ud.bool(forKey: UDKeys.userDidRefister.rawValue)
    }
}


enum UDKeys: String {
    case userDidRefister = "UserDidRegister"
}
