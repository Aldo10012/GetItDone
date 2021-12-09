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
    var viewModel: DetailViewModel
    
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
    
    let tableView = UITableView()
    
    // details
    let detailBG = GDGradient(radius: 25)
    
    
    // MARK: - Init

    init(todo: ToDo) {
        self.todo = todo
        self.viewModel = DetailViewModel(todo: todo)
        print(viewModel)
        
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
        
        detailBG.addSubview(tableView)
        tableView.anchor(top: detailBG.topAnchor, left: detailBG.leftAnchor, bottom: detailBG.bottomAnchor, right: detailBG.rightAnchor, paddingTop: 40, paddingLeft: 20, paddingBottom: 40, paddingRight: 20)
        
        tableViewSetup()
    }
    
    // MARK: - Table View
    func tableViewSetup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "detail")
    }


}

// MARK: - Delegate
extension DetailVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detail")!
        cell.textLabel?.textColor = .blueOne
        cell.imageView?.tintColor = .blueOne
        
        let cellData = viewModel.tableViewData[indexPath.row]
        
        if let image = cellData["image"] {
            cell.imageView?.image = UIImage(systemName: image as! String)
        }
        
        if let detail = cellData["detail"] {
            cell.textLabel!.text = "\(detail)"
        }
        
        
//        let image = cellData["image"] as? String
//        let detail = cellData["detail"] as? String
//        print(cellData)
        
//        cell.textLabel!.text = "\(detail)" //?? ""
//        cell.imageView?.image = UIImage(systemName: image ?? "")
        
        
        
        return cell
    }
    
    
}


// MARK: - ViewModel
struct DetailViewModel {
    let todo: ToDo
    
    init(todo: ToDo) {
        self.todo = todo
    }
    
    var title: String { return todo.title! }
    var status: Bool { return todo.status }
    
    var tableViewData: [[String: Any]] {
        return [
            ["image": "textbox",          "detail": title],  // for title cell
            ["image": "checkmark.circle", "detail": status]  // for status cell
        ]
    }
    
}
