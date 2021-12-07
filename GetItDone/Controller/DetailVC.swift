//
//  DetailVC.swift
//  GetItDone
//
//  Created by Alberto Dominguez on 12/6/21.
//

import UIKit
import CoreData

class DetailVC: UIViewController {

    // MARK: - Properties
    
    var todo: ToDo
    
    
    // MARK: - Init

    init(todo: ToDo) {
        self.todo = todo
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Do any additional setup after loading the view.
        print(todo)
    }
    


}
