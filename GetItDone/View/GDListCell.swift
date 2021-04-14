//
//  GDListCell.swift
//  GetItDone
//
//  Created by Alberto Dominguez on 4/5/21.
//

import UIKit

class GDListCell: UITableViewCell{
    
    let titleLabel = GDLabel(title: "ToDo", color: .white, size: 20, font: "Raleway-SemiBold")
    let box = GDCheckBox()
    
    var toDo: ToDo? {
        didSet{
            if let toDo = toDo {
                print(toDo.status)
                box.toggled = toDo.status
                box.id = toDo.id
                titleLabel.text = toDo.title
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = .clear
//        textLabel?.textColor = .white
        
        setupViews()
        
    }
    
    func setupViews(){
        self.contentView.addSubview(box)
        NSLayoutConstraint.activate([
            box.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            box.centerYAnchor.constraint(equalTo: centerYAnchor),
            box.heightAnchor.constraint(equalToConstant: 20),
            box.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: box.rightAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
