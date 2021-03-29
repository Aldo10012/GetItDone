//
//  ListVC.swift
//  GetItDone
//
//  Created by Alberto Dominguez on 3/28/21.
//

import UIKit

class ListVC: UIViewController, GDHeaderDelegate {
    
    let header = GDHeaderView(title: "Stuff to get done", subtitle: "4 left")

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setUpViews()
    }
    
    func setUpViews(){
        view.addSubview(header)
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.topAnchor),
            header.heightAnchor.constraint(equalToConstant: 120),
            header.leftAnchor.constraint(equalTo: view.leftAnchor),
            header.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
        header.delegate = self
    }

    func addItem() {
        print("trying to add item")
    }
}
