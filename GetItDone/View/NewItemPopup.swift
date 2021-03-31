//
//  NewItemPopup.swift
//  GetItDone
//
//  Created by Alberto Dominguez on 3/31/21.
//

import UIKit

class NewItemPopup: GDGradient {

    override init(frame: CGRect){
        super.init(frame: frame )
        
        self.layer.cornerRadius = 15
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
