//
//  GDCheckBox.swift
//  GetItDone
//
//  Created by Alberto Dominguez on 4/5/21.
//

import UIKit

class GDCheckBox: UIButton {
    var toggled: Bool? {
        didSet{
            if let toggled = toggled {
                if toggled {
                    self.backgroundColor = .green
                }else{
                    self.backgroundColor = .white
                }
                
            }
        }
    }
    override init(frame: CGRect) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
//        layer.borderWidth = 1
//        layer.borderColor = UIColor.grayZero.cgColor
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
