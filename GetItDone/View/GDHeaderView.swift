//
//  GDHeaderView.swift
//  GetItDone
//
//  Created by Alberto Dominguez on 3/29/21.
//

import Foundation
import UIKit

class GDHeaderView: UIView{
    let bg = GDGradient()
    var titleLabel = GDLabel(title: "Header")
    var subtitleLabel = GDLabel(title: "Sub header", size: 24 )
    let addButton = GDButton(type: .squareIcon)
    var delegate: GDHeaderDelegate?
    
    init(frame: CGRect = .zero, title: String = "title", subtitle: String = "subtitle"){
        super.init(frame: frame)
        if frame == .zero{
            translatesAutoresizingMaskIntoConstraints = false
        }
        self.titleLabel.text = title
        self.subtitleLabel.text = subtitle
        
        setUpLayout()
    }
    
    var itemsLeft: Int = 0 {
        didSet{
            self.subtitleLabel.text = "\(itemsLeft) Left"
        }
    }
    
    func setUpLayout(){
        addSubview(bg)
        bg.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 60, paddingLeft: 28)
        titleLabel.setWidth(relativeTo: widthAnchor, multiplier: 0.5)
        
        
        addSubview(subtitleLabel)
        subtitleLabel.anchor(top: titleLabel.topAnchor, left: titleLabel.leftAnchor, paddingTop: 20)
        subtitleLabel.setWidth(relativeTo: widthAnchor, multiplier: 0.5)
        
        
        addSubview(addButton)
        addButton.layer.cornerRadius = 15
        addButton.anchor(bottom: subtitleLabel.bottomAnchor, right: rightAnchor, paddingBottom: 0, paddingRight: 28, width: 30, height: 30)
        
        
        addButton.addTarget(self, action: #selector(self.handleAddButton), for: .touchUpInside)
    }
    
    @objc func handleAddButton(){
        // print("trying to handle add button")
        if let delegate = self.delegate{
            delegate.openAddItemPopup()
        }else { print("error") }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
