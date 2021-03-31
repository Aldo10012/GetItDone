//
//  GDTextField.swift
//  GetItDone
//
//  Created by Alberto Dominguez on 3/31/21.
//

import UIKit

class GDTextField: UITextField {
    init(frame: CGRect = .zero, placeholder: String = "Placeholder", radius: CGFloat = 0){
        super.init(frame: frame)
        checkIfAutoLayout()
        
        self.placeholder = placeholder
        self.backgroundColor = .white
        self.layer.cornerRadius = radius
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
