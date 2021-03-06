//
//  Gradient.swift
//  GetItDone
//
//  Created by Alberto Dominguez on 3/28/21.
//

import Foundation
import UIKit

class GDGradient: UIView {
    
    var colors: [CGColor] = [
        UIColor.blueZero.cgColor,
        UIColor.blueOne.cgColor
    ]

    init(frame: CGRect = .zero, radius: CGFloat = 0){
        super.init(frame: frame)
        
        if frame == .zero{
            translatesAutoresizingMaskIntoConstraints = false
        }
        if let layer = self.layer as? CAGradientLayer {
            layer.colors = self.colors
            layer.locations = [0.0, 1.2]
        }
        self.layer.cornerRadius = radius
        
        
    }
    
    override class var layerClass: AnyClass{
        return CAGradientLayer.self
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
