//
//  UiView-ext.swift
//  GetItDone
//
//  Created by Alberto Dominguez on 3/31/21.
//

import UIKit

extension UIView {
    func checkIfAutoLayout(){
//        if frame == .zero{
            translatesAutoresizingMaskIntoConstraints = false
//        }
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
    

    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {
        
        checkIfAutoLayout()
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func centerX(inView view: UIView) {
        checkIfAutoLayout()
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func centerY(inView view: UIView, leftAnchor: NSLayoutXAxisAnchor? = nil,
                 paddingLeft: CGFloat = 0, constant: CGFloat = 0) {
        
        checkIfAutoLayout()
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
        
        if let left = leftAnchor {
            anchor(left: left, paddingLeft: paddingLeft)
        }
    }
    
    func setDimensions(height: CGFloat, width: CGFloat) {
        checkIfAutoLayout()
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func setHeight(height: CGFloat) {
        checkIfAutoLayout()
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func setHeight(relativeTo anchor: NSLayoutDimension, multiplier: CGFloat = 1){
        checkIfAutoLayout()
        heightAnchor.constraint(equalTo: anchor, multiplier: multiplier).isActive = true
    }
    
    func setWidth(width: CGFloat) {
        checkIfAutoLayout()
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func setWidth(relativeTo anchor: NSLayoutDimension, multiplier: CGFloat = 1){
        checkIfAutoLayout()
        widthAnchor.constraint(equalTo: anchor, multiplier: multiplier).isActive = true
    }
        
}
