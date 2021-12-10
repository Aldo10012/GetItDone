//
//  NewItemPopup.swift
//  GetItDone
//
//  Created by Alberto Dominguez on 3/31/21.
//

import UIKit

class GDNewItemPopup: GDGradient {
    let cancle = GDButton(title: "   cancle   ", type: .roundedtext, radius: 5)
    let add = GDButton(title: "   add   ", type: .roundedtext, radius: 5)
    let textField = GDTextField(placeholder: "Go buy IKEA frame", radius: 5)
    var delegate: GDNewItemDelegate?

    override init(frame: CGRect = .zero, radius: CGFloat = 15){
        super.init(frame: frame, radius: radius)
        self.layer.cornerRadius = radius
//        self.layer.masksToBounds = true
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.animatePopup)))
        
        addViews(15)
    }
    
    var popupLocation:CGFloat = -90
    @objc func animatePopup() {
        print("trying to add item")
        self.animateView(transform: CGAffineTransform(translationX: 0, y: popupLocation), duration: 0.3)
        if popupLocation == -90{
            popupLocation = 0
        }else {
            textField.resignFirstResponder()
            popupLocation = -90
        }
    }
    
    func addViews(_ inset: CGFloat){
        let inset = inset
        
        addSubview(cancle)
        cancle.anchor(top: topAnchor, left: leftAnchor, paddingTop: inset, paddingLeft: inset, height: 24)

        cancle.addTarget(self, action: #selector(self.handleCancel), for: .touchUpInside)
        
        addSubview(add)
        add.anchor(top: topAnchor, right: rightAnchor, paddingTop: inset, paddingRight: inset, height: 24)
        
        add.addTarget(self, action: #selector(self.handleAdd), for: .touchUpInside)
        
        addSubview(textField)
        textField.anchor(top: cancle.bottomAnchor, left: leftAnchor, right: rightAnchor,
                         paddingTop: 8, paddingLeft: inset, paddingRight: inset,
                         height: 28)
        
    }
    
    @objc func handleCancel(){
//        textField.resignFirstResponder()
        self.animatePopup()
    }
    
    @objc func handleAdd(){
        if let delegate = self.delegate{
            if let text = self.textField.text{
                delegate.addItemToList(text: text )
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
