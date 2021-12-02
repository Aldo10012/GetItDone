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
    let popup = GDNewItemPopup()
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
        
//        listData = [
//            ToDo(id: 0, title: "Make bed", status: false),
//            ToDo(id: 1, title: "Do homework", status: false),
//            ToDo(id: 2, title: "workout", status: false),
//            ToDo(id: 3, title: "cook", status: false),
//            ToDo(id: 4, title: "become president", status: false)
//        ]
        
        self.updateHeaderItemsLeft()
        
        view.backgroundColor = .white
        setUpViews()
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
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.topAnchor),
            header.heightAnchor.constraint(equalToConstant: 120),
            header.leftAnchor.constraint(equalTo: view.leftAnchor),
            header.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
        view.addSubview(bg)
        NSLayoutConstraint.activate([
            bg.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            bg.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            bg.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 20),
            bg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120)
        ])
        
        bg.addSubview(listTable)
        NSLayoutConstraint.activate([
            listTable.leftAnchor.constraint(equalTo: bg.leftAnchor, constant: tbInset),
            listTable.topAnchor.constraint(equalTo: bg.topAnchor, constant: tbInset),
            listTable.bottomAnchor.constraint(equalTo: bg.bottomAnchor, constant: tbInset * -1),
            listTable.rightAnchor.constraint(equalTo: bg.rightAnchor, constant: tbInset * -1)
        ])
        
        view.addSubview(popup)
        NSLayoutConstraint.activate([
            popup.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 90),
            popup.heightAnchor.constraint(equalToConstant: 100),
            popup.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            popup.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
        

        popup.textField.delegate = self
        popup.delegate = self
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
        popup.animatePopup()
    }
}

// MARK: TextField Delegate
extension ListVC: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        popup.animateView(transform: CGAffineTransform(translationX: 0, y: -keyboardHeight-100), duration: 0.5)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        popup.animateView(transform: CGAffineTransform(translationX: 0, y: 0), duration: 0.6)
        popup.textField.text = ""
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
//            let newItem = ToDo(id: self.listData.count, title: text, status: false)
//            let newItem = ToDo(context: myData.managedContext)
//            newItem.title = text
//            newItem.status = false
            
            myData.createNewTodo(title: text, status: false)
            
            fetchToDoList()
            
            self.updateHeaderItemsLeft()
            self.popup.textField.text = ""
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
}

// MARK: GDListCellDelegate
extension ListVC: GDListCellDelegate {
    func toggleToDo(status: Bool) {
        print("tryingto toggle todo in db")
//        print(id, status)
        
        fetchToDoList()
        
        let newListData = self.listData.map { (toDo) -> ToDo in
//            if toDo.id == id{
//                var newToDo = toDo
//                newToDo.status = status
//                return newToDo
//            }
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
