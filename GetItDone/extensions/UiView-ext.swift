//
//  UiView-ext.swift
//  GetItDone
//
//  Created by Alberto Dominguez on 3/31/21.
//

import UIKit

extension UIView {
    func checkIfAutoLayout(){
        if frame == .zero{
            translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
