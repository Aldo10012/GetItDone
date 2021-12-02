//
//  Protocol.swift
//  GetItDone
//
//  Created by Alberto Dominguez on 3/29/21.
//

import Foundation

protocol GDHeaderDelegate {
    func openAddItemPopup()
}

protocol GDNewItemDelegate{
    func addItemToList(text:String)
}

protocol GDListCellDelegate{
    func toggleToDo(status: Bool)
}
