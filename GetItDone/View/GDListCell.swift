//
//  GDListCell.swift
//  GetItDone
//
//  Created by Alberto Dominguez on 4/5/21.
//

import UIKit
import CoreData

class GDListCell: UITableViewCell{
    
    var delegate: GDListCellDelegate?
    let myData = CoreDataManager.shared
    
    let titleLabel = GDLabel(title: "ToDo", color: .white, size: 20, font: "Raleway-SemiBold")
    let box = GDCheckBox()
    
    var todo: ToDo? {
        didSet{
            if let toDo = todo {
                print(toDo.status)
                box.toggled = toDo.status
//                box.id = toDo.id
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
        box.addTarget(self, action: #selector(self.toggleStatus), for: .touchUpInside)
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
    
    @objc func toggleStatus(){
        print("toggling todo")
//        if let status = box.toggled, let delegate = self.delegate, let id = box.id{
//            box.toggled = !status
//            delegate.toggleToDo(id: id, status: !status)
//        }
        
        myData.toggleTodoItem(todo!)
        self.delegate?.toggleToDo(status: !box.toggled!)
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
