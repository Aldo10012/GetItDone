//
//  ListVC.swift
//  GetItDone
//
//  Created by Alberto Dominguez on 3/28/21.
//

import UIKit
import CoreData

class ListVC: UIViewController, GDHeaderDelegate  {
    
    // MARK: Properties
    let header = GDHeaderView(title: "Stuff to get done", subtitle: "4 left")
    var keyboardHeight:CGFloat = 333
    let bg = GDGradient(radius: 25)
    let listTable = GDTableView()
    let CELL_ID = "cell_id"
    
    let myData = CoreDataManager.shared
    
    var listData = [ToDo]()
    
    let tbInset:CGFloat = 25
    
    // MARK: Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.updateHeaderItemsLeft()
        
        view.backgroundColor = .white
        setUpViews()
        fetchToDoList()
        updateHeaderItemsLeft()
        createObservers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("APPEARED")
        fetchToDoList()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self,
            selector: #selector(keyboardWillShow(notification:)),
            name: UIResponder.keyboardDidShowNotification, object: nil
        )
    }
    
    //MARK: Selecters
    @objc func keyboardWillShow(notification: Notification) {
        let keyboardSize = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size
        self.keyboardHeight = keyboardSize.height

    }
    
    func updateHeaderItemsLeft() {
        header.itemsLeft = 0
        self.listData.forEach { (ToDo) in
            if !ToDo.status{header.itemsLeft += 1}
        }
    }
    
    func setUpViews(){
        view.addSubview(header)
        
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        
        header.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 120)
        
        view.addSubview(bg)
        bg.anchor(top: header.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 120, paddingRight: 20)
        
        bg.addSubview(listTable)
        listTable.anchor(top: bg.topAnchor, left: bg.leftAnchor, bottom: bg.bottomAnchor, right: bg.rightAnchor, paddingTop: tbInset, paddingLeft: tbInset, paddingBottom: tbInset, paddingRight: tbInset)

        header.delegate = self
        listTable.delegate = self
        listTable.dataSource = self
        listTable.register(GDListCell.self, forCellReuseIdentifier: CELL_ID)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    func openAddItemPopup() {
        print("trying to add item")
//        popup.animatePopup()
        let vc = ToDoVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    // MARK: Observers
    func createObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(foobar), name: .todoWasAdded, object: nil)
    }
    
    @objc func foobar() {
        fetchToDoList()
        updateHeaderItemsLeft()
    }
}


// MARK: CGNewItemDelegate
extension ListVC: GDNewItemDelegate{
    // runs then + button is clicked
    func addItemToPopup() {
        print("trying to open item popup view")
    }
    
    func notInList(text:String) -> Bool {
        var isNotInList = true
        self.listData.forEach { (toDo) in
            if toDo.title == text{
                isNotInList = false
            }
        }
        return isNotInList
    }
    
    // runs when add button is clicked
    func addItemToList(text: String){
        print("text in textfield is: \(text)")
        if (notInList(text: text)){
            
//            myData.createNewTodo(title: text, status: false)
            
            fetchToDoList()
            
            self.updateHeaderItemsLeft()
//            self.popup.textField.text = ""
            //self.popup.animatePopup()
        }
    }
    
    func fetchToDoList() {
        myData.getTodoList(andSaveToArray: &listData)
        print(listData)
        
        DispatchQueue.main.async {
            self.listTable.reloadData()
        }
        
    }
}

// MARK: TableView delegates
extension ListVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "To Do"
        }
        return "Done"
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let titleForHeader = GDLabel(title: "", color: .white, size: 20, frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 44))
        if section == 0{
            titleForHeader.text = "To Do"
        }else{
            titleForHeader.text = "Done"
        }
        
        return titleForHeader
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 38
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        self.listData.forEach { (toDo) in
            if section == 0 && !toDo.status{
                count += 1
            }else if (section == 1 && toDo.status){
                count += 1
            }
        }
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath) as! GDListCell
        
        cell.delegate = self
        var itemsForSection:[ToDo] = []
        self.listData.forEach { (toDo) in
            if indexPath.section == 0 && !toDo.status{
                itemsForSection.append(toDo)
            }else if (indexPath.section == 1 && toDo.status){
                itemsForSection.append(toDo)
            }
        }
        
        cell.todo = itemsForSection[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let object = listData[indexPath.row]
            self.listData.remove(at: indexPath.row)
            myData.deleteTodoItem(object)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
        self.updateHeaderItemsLeft()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 42
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(listData[indexPath.row])
        let todo = listData[indexPath.row]
        let vc = ToDoVC(todo: todo)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}

// MARK: GDListCellDelegate
extension ListVC: GDListCellDelegate {
    func toggleToDo(status: Bool) {
        print("tryingto toggle todo in db")
//        print(id, status)
        
        fetchToDoList()
        
        let newListData = self.listData.map { (toDo) -> ToDo in
            return toDo
        }
        self.listData = newListData
        self.listTable.reloadData()
        self.updateHeaderItemsLeft()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}
