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
    let infoLabel = GDLabel(title: "WELCOME. GET IT DONE IS A TODO-LIST. \nA REALLY DOPE TODO-LIST", size: 14, alignment: .center)
    
    let nextButton = GDButton(title: "START WINNING", type: .roundedtext )
    
    @objc func handleNext() {
        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.nextButton.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
        }) { (_) in
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                self.nextButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            }) { (_) in
                //self.present(ListVC(), animated: true, completion: nil)
                UIApplication.shared.windows.first?.rootViewController = ListVC()
            }
        }
    }
    
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
        
        bg.addSubview(infoLabel)
        infoLabel.numberOfLines = 2
        NSLayoutConstraint.activate([
            infoLabel.centerXAnchor.constraint(equalTo: bg.centerXAnchor),
            infoLabel.centerYAnchor.constraint(equalTo: bg.centerYAnchor),
            infoLabel.widthAnchor.constraint(equalToConstant: 300),
            infoLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        bg.addSubview(nextButton)
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: bg.centerXAnchor),
            nextButton.bottomAnchor.constraint(equalTo: bg.bottomAnchor, constant: -60),
            nextButton.widthAnchor.constraint(equalToConstant: 200),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        nextButton.addTarget(self, action: #selector(self.handleNext), for: .touchUpInside)
    }
    
    
}

