//
//  GDListCell.swift
//  GetItDone
//
//  Created by Alberto Dominguez on 4/5/21.
//

import UIKit

class GDListCell: UITableViewCell{
    
    let titleLabel = GDLabel(title: "ToDo", color: .white, size: 20, font: "Raleway-SemiBold")
    
    var toDo: ToDo? {
        didSet{
            if let toDo = toDo {
                print(toDo.id)
                print(toDo.title)
                print(toDo.status)
                
                self.titleLabel.text = toDo.title
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
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
