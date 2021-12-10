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
    var type: ButtonOptions!
    var radius: CGFloat!
    
    init(title: String = "Next", frame: CGRect = .zero, type: ButtonOptions = .roundedtext, radius: CGFloat = 20){
        super.init(frame: frame)
        if frame == .zero{
            translatesAutoresizingMaskIntoConstraints = false
        }
        
        self.title = title
        self.type = type
        self.radius = radius
        phaseTwo()

    }
    
    func phaseTwo(){

        self.backgroundColor = .white
        
        if let titlelabel = self.titleLabel{
            titlelabel.font = UIFont.init(name: "Raleway-Regular", size: 18)
        }
        
        switch self.type {
            case ButtonOptions.roundedtext:
                roundedText()
                
            case ButtonOptions.squareIcon:
                self.squareIcon()
                
            case ButtonOptions.squareText:
                break
            
            case ButtonOptions.todoMain:
                self.todoMainButton()
                
            default: break
        }
    }
    
    func roundedText(){
        self.setTitle(self.title, for:.normal)
        self.setTitleColor(.grayZero, for: .normal)
        self.layer.cornerRadius = self.radius
    }
    
    func squareIcon(){
        self.setImage(UIImage(named: "add-icon"), for: .normal)
    }
    
    func todoMainButton() {
        self.backgroundColor = .blueOne
        self.setTitle(self.title, for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.layer.cornerRadius = self.radius
        self.setHeight(height: 50)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
