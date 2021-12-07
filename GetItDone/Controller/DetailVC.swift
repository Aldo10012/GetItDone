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
    
    // navbar
    let navbar = GDGradient()
    
    let backButton: UIButton = {
        let btn = UIButton()
        let img = UIImage(systemName: "chevron.left")
//        img?.withTintColor(.white)
        btn.setImage(img, for: .normal)
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(handleBackButton), for: .touchUpInside)
        return btn
    }()
    
    // details
    let detailBG = GDGradient(radius: 25)
    
    
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
        setupViews()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    
    // MARK: - Selectors
    @objc func handleBackButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    // MARK: - UI Set up
    func setupViews() {
        configureNavigationBar(withTitle: "", prefersLargeTitles: false)
        
        setupNavbar()
        setupDetails()
    }
    
    func setupNavbar() {
        view.addSubview(navbar)
        navbar.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 90)
        
        navbar.addSubview(backButton)
        backButton.anchor(left: navbar.leftAnchor, bottom: navbar.bottomAnchor, paddingLeft: 16, paddingBottom: 12)
    }
    
    func setupDetails() {
        view.addSubview(detailBG)
        detailBG.anchor(top: navbar.bottomAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 30, paddingLeft: 20, paddingBottom: 100, paddingRight: 20)
    }
    


}
