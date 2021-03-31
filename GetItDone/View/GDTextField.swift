//
//  GDTextField.swift
//  GetItDone
//
//  Created by Alberto Dominguez on 3/31/21.
//

import UIKit

class GDTextField: UITextField {
    var inset: UIEdgeInsets!
    
    init(frame: CGRect = .zero, placeholder: String = "Placeholder", radius: CGFloat = 0, inset: CGFloat = 8){
        super.init(frame: frame)
        checkIfAutoLayout()
        
        self.placeholder = placeholder
        self.backgroundColor = .white
        self.layer.cornerRadius = radius
        self.inset = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
        self.textColor = .grayZero 
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: self.inset)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: self.inset)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: self.inset)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
