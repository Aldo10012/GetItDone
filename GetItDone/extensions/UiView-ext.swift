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
    
    func animateView(transform: CGAffineTransform, duration: TimeInterval){
        UIView.animate(
            withDuration: duration,
            delay: 0,
            usingSpringWithDamping: 0.85,
            initialSpringVelocity: 2,
            options: .curveEaseIn,
            animations: {
                self.transform =  transform
            },
            completion: nil
        )
    }
}
