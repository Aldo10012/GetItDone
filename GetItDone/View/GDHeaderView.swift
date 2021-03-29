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
    let addButton = GDButton(title: "+", type: .squareIcon)
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
    
    func setUpLayout(){
        addSubview(bg)
        NSLayoutConstraint.activate([
            bg.leftAnchor.constraint(equalTo: leftAnchor),
            bg.rightAnchor.constraint(equalTo: rightAnchor),
            bg.topAnchor.constraint(equalTo: topAnchor),
            bg.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 28),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            titleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5)
        ])
        
        addSubview(subtitleLabel)
        NSLayoutConstraint.activate([
            subtitleLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 20),
            subtitleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5)
        ])
        
        addSubview(addButton)
        NSLayoutConstraint.activate([
            addButton.bottomAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 0),
            addButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -28),
            addButton.widthAnchor.constraint(equalToConstant: 24),
            addButton.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        addButton.addTarget(self, action: #selector(self.handleAddButton), for: .touchUpInside)
    }
    
    @objc func handleAddButton(){
        // print("trying to handle add button")
        if let delegate = self.delegate{
            delegate.addItem()
        }else { print("error") }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
