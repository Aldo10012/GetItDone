//
//  NewItemPopup.swift
//  GetItDone
//
//  Created by Alberto Dominguez on 3/31/21.
//

import UIKit

class NewItemPopup: GDGradient {
    let cancle = GDButton(title: "   cancle   ", type: .roundedtext, radius: 5)
    let add = GDButton(title: "   add   ", type: .roundedtext, radius: 5)

    override init(frame: CGRect){
        super.init(frame: frame )
        self.layer.cornerRadius = 15
        
        addViews(15)
    }
    
    func addViews(_ inset: CGFloat){
        let inset = inset
        
        addSubview(cancle)
        NSLayoutConstraint.activate([
            cancle.leftAnchor.constraint(equalTo: leftAnchor , constant: inset),
            cancle.topAnchor.constraint(equalTo: topAnchor, constant: inset ),
            cancle.heightAnchor.constraint(equalToConstant: 20),
            
        ])
        
        addSubview(add)
        NSLayoutConstraint.activate([
            add.rightAnchor.constraint(equalTo: rightAnchor , constant: (inset * -1)),
            add.topAnchor.constraint(equalTo: topAnchor, constant: inset ),
            add.heightAnchor.constraint(equalToConstant: 20),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
