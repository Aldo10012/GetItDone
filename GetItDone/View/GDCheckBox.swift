//
//  GDCheckBox.swift
//  GetItDone
//
//  Created by Alberto Dominguez on 4/5/21.
//

import UIKit

class GDCheckBox: UIButton {
    var toggled: Bool? {
        didSet{
            if let toggled = toggled {
                if toggled {
                    self.backgroundColor = .green
                    setImage(UIImage(named: "done-icon"), for: .normal)
                }else{
                    self.backgroundColor = .white
                    setImage(UIImage(), for: .normal)
                }
                
            }
        }
    }
    
    @objc func toggleStatus(){
        if let toggled = toggled{
            self.toggled = !toggled
        }
        print("toggling")
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        addTarget(self, action: #selector(self.toggleStatus), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
