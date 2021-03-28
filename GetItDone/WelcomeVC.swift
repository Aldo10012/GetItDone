//
//  ViewController.swift
//  GetItDone
//
//  Created by Alberto Dominguez on 3/28/21.
//

import UIKit

class WelcomeVC: UIViewController {

    let bg: UIView  = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .cyan
        view.layer.cornerRadius = 25
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        setUpViews()
    }
    
    func setUpViews(){
        view.addSubview(bg)
        NSLayoutConstraint.activate([
            bg.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            bg.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            bg.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            bg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60)
        ])
    }


}

