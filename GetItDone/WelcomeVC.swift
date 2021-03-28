//
//  ViewController.swift
//  GetItDone
//
//  Created by Alberto Dominguez on 3/28/21.
//

import UIKit

class WelcomeVC: UIViewController {

    let bg: UIView = {
        let view = GDGradient()
        view.layer.cornerRadius = 25
        return view
    }()
    
    let titleLabel = GDLabel(title: "GET IT DONE", size: 26, alignment: .center, font: "Raleway-SemiBold")
    
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
            bg.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            bg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
        
        bg.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(equalToConstant: 200),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            titleLabel.centerXAnchor.constraint(equalTo: bg.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: bg.topAnchor, constant: 60)
            
        ])
    }


}

