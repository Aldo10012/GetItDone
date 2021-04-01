//
//  ListVC.swift
//  GetItDone
//
//  Created by Alberto Dominguez on 3/28/21.
//

import UIKit

class ListVC: UIViewController, GDHeaderDelegate  {
    
    let header = GDHeaderView(title: "Stuff to get done", subtitle: "4 left")
    let popup = GDNewItemPopup()
    var keyboardHeight:CGFloat = 333
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setUpViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self,
            selector: #selector(keyboardWillShow(notification:)),
            name: UIResponder.keyboardDidShowNotification, object: nil
        )
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        let keyboardSize = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size
        self.keyboardHeight = keyboardSize.height
        
        

    }
    
    func setUpViews(){
        view.addSubview(header)
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.topAnchor),
            header.heightAnchor.constraint(equalToConstant: 120),
            header.leftAnchor.constraint(equalTo: view.leftAnchor),
            header.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
        view.addSubview(popup)
        NSLayoutConstraint.activate([
            popup.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            popup.heightAnchor.constraint(equalToConstant: 100),
            popup.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            popup.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
        
        popup.textField.delegate = self
        popup.delegate = self
        header.delegate = self
    }
    
    func openAddItemPopup() {
        print("trying to add item")
    }
}

extension ListVC: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        popup.animateView(transform: CGAffineTransform(translationX: 0, y: -keyboardHeight), duration: 0.5)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        popup.animateView(transform: CGAffineTransform(translationX: 0, y: 0), duration: 0.6)
        popup.textField.text = ""
    }
    
    
    
}

extension ListVC: GDNewItemDelegate{
    func addItemToPopup() {
        print("trying to open item popup view")
    }
    
    func addItemToList(text: String){
        print("text in textfield is: \(text)")
    }
}
