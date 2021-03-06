//
//  TitleLabel.swift
//  GetItDone
//
//  Created by Alberto Dominguez on 3/28/21.
//

import Foundation
import UIKit

class GDLabel: UILabel{
    
    init(title: String,
         color: UIColor = .white,
         size: CGFloat = 16,
         alignment: NSTextAlignment = .left,
         font: String = "Raleway-Regular",
         frame:CGRect = .zero)
    {
        super.init(frame: frame)
        if frame == .zero{
            translatesAutoresizingMaskIntoConstraints = false
        }
        self.text = title
        self.textColor = color
        self.font = UIFont.init(name: font, size: size)
        self.textAlignment = alignment
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
