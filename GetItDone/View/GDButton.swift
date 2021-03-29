//
//  GDButton.swift
//  GetItDone
//
//  Created by Alberto Dominguez on 3/28/21.
//

import Foundation
import UIKit

class GDButton: UIButton {
    var title: String!
    
    init(title: String = "Next", frame: CGRect = .zero, type: ButtonOptions = .roundedtext){
        super.init(frame: frame)
        if frame == .zero{
            translatesAutoresizingMaskIntoConstraints = false
        }
        
        switch type {
            case .roundedtext:
                self.title = title
                phaseTwo()
                
            case .squareIcon:
                break
                
            case .squareText:
                break
                
            default: break
        }
        
        

    }
    
    func phaseTwo(){
        self.setTitle(self.title, for:.normal)
        self.setTitleColor(.grayZero, for: .normal)
        self.layer.cornerRadius = 14
        self.backgroundColor = .white
        if let titlelabel = self.titleLabel{
            titlelabel.font = UIFont.init(name: "Raleway-Regular", size: 18)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
