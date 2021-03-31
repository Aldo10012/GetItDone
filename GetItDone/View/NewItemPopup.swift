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
    let textField = GDTextField(placeholder: "Go buy IKEA frame", radius: 5)

    override init(frame: CGRect = .zero, radius: CGFloat = 15){
        super.init(frame: frame, radius: radius)
        self.layer.cornerRadius = radius
        
        addViews(15)
    }
    
    func addViews(_ inset: CGFloat){
        let inset = inset
        
        addSubview(cancle)
        NSLayoutConstraint.activate([
            cancle.leftAnchor.constraint(equalTo: leftAnchor , constant: inset),
            cancle.topAnchor.constraint(equalTo: topAnchor, constant: inset ),
            cancle.heightAnchor.constraint(equalToConstant: 24),
        ])
        cancle.addTarget(self, action: #selector(self.handleCancel), for: .touchUpInside)
        
        addSubview(add)
        NSLayoutConstraint.activate([
            add.rightAnchor.constraint(equalTo: rightAnchor , constant: (inset * -1)),
            add.topAnchor.constraint(equalTo: topAnchor, constant: inset ),
            add.heightAnchor.constraint(equalToConstant: 24),
        ])
        add.addTarget(self, action: #selector(self.handleAdd), for: .touchUpInside)
        
        addSubview(textField)
        NSLayoutConstraint.activate([
            textField.leftAnchor.constraint(equalTo: leftAnchor, constant: inset),
            textField.rightAnchor.constraint(equalTo: rightAnchor, constant: inset * -1),
            textField.topAnchor.constraint(equalTo: cancle.bottomAnchor, constant: 8),
            textField.heightAnchor.constraint(equalToConstant: 28)
        
        ])
    }
    
    @objc func handleCancel(){
        print("clicked cancle")
    }
    
    @objc func handleAdd(){
        print("clicked add")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
