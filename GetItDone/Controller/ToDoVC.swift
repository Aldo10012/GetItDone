//
//  ToDoVC.swift
//  GetItDone
//
//  Created by Alberto Dominguez on 12/9/21.
//

import UIKit
import CoreData

class ToDoVC: UIViewController {
    
    // MARK: Properties
    var todo: ToDo?
    var isOnEdit: Bool
    let myData = CoreDataManager.shared
    
    // HEADER
    lazy var header: GDGradient = {
        let v = GDGradient()
        v.addSubview(headerTitle)
        headerTitle.centerX(inView: v)
        headerTitle.anchor(bottom: v.bottomAnchor, paddingBottom: 8)
        
        v.addSubview(backButton)
        backButton.anchor(left: v.leftAnchor, bottom: v.bottomAnchor, paddingLeft: 16, paddingBottom: 12)
        return v
    }()
    
    var headerTitle = GDLabel(title: "Add New Task", color: .white, size: 20, alignment: .center, font: "Raleway-SemiBold")
    
    let backButton: UIButton = {
        let btn = UIButton()
        let img = UIImage(systemName: "chevron.left")
        btn.setImage(img, for: .normal)
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(handleBackButton), for: .touchUpInside)
        return btn
    }()
    
    // BODY
    let body = GDGradient(radius: 25)
    var titleTextField: GDTextField = {
        let tf = GDTextField(placeholder: "Add title here", inset: 0)
        tf.attributedPlaceholder = NSAttributedString(string: "Add title here", attributes: [.foregroundColor : UIColor.white]
        )
        tf.textColor = .white
        tf.tintColor = .white
        tf.backgroundColor = .clear
        tf.font = UIFont.init(name: "Raleway-Regular", size: 18)
        return tf
    }()
    var notesTextView: UITextView = {
        let tv = UITextView()
        tv.text = "Add a note here"
        tv.textColor = .white
        tv.backgroundColor = .clear
        tv.font = UIFont.init(name: "Raleway-Regular", size: 18)
        return tv
    }()
    
    var mainButton = GDButton(title: "+ Add Todo", type: .todoMain, radius: 15)
    
    // padding inset
    let inset: CGFloat = 28
    
    
    // MARK: Init
    convenience init(todo: ToDo) {
        self.init()
        self.todo = todo
        self.isOnEdit = true
        self.headerTitle.text = "Edit Task"
        self.titleTextField.text = todo.title
        self.notesTextView.text = todo.notes
        self.mainButton.setTitle("+ Edit Todo", for: .normal)
    }
    
    init() {
        self.todo = nil
        self.isOnEdit = false
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    // MARK: Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureUI()
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    // MARK: Selectors
    @objc func handleBackButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func handleMainButton() {
        switch self.isOnEdit {
        case true:
            print("did edit todo")
            
            let title = titleTextField.text!
            var notes = notesTextView.text!
            if notes == "Add a note here" { notes = "" }
            
            print("title: \(title) ", "notes: \(notes)")
            
            myData.editTodoItem(todo: self.todo!, title: title, notes: notes)
            
            
        case false:
            print("did add todo")
            
            let title = titleTextField.text!
            var notes = notesTextView.text!
            if notes == "Add a note here" { notes = "" }
            
            print(title, notes)
            
            myData.createNewTodo(title: title, status: false, notes: notes)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: UI
    
    func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(header)
        header.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 88)
        
        // BODY
        
        view.addSubview(body)
        body.anchor(top: header.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor,
                    paddingTop: 45, paddingLeft: 20, paddingBottom: 200, paddingRight: 20)
        
        let titleLabel = GDLabel(title: "TITLE", size: 18, font: "Raleway-SemiBold")
        body.addSubview(titleLabel)
        titleLabel.anchor(top: body.topAnchor, left: body.leftAnchor, paddingTop: 38, paddingLeft: inset)
        
        body.addSubview(titleTextField)
        titleTextField.anchor(top: titleLabel.bottomAnchor, left: body.leftAnchor, right: body.rightAnchor, paddingTop: 15, paddingLeft: inset, paddingRight: inset)
        
        let noteLabel = GDLabel(title: "NOTES", size: 18, font: "Raleway-SemiBold")
        body.addSubview(noteLabel)
        noteLabel.anchor(top: titleTextField.bottomAnchor, left: body.leftAnchor, paddingTop: 38, paddingLeft: inset)
        
        body.addSubview(notesTextView)
        notesTextView.anchor(top: noteLabel.bottomAnchor, left: body.leftAnchor, right: body.rightAnchor, paddingTop: 15, paddingLeft: inset, paddingRight: inset, height: 80
        )
        notesTextView.delegate = self

        
        
        // Buttons
        view.addSubview(mainButton)
        mainButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 20, paddingBottom: 5, paddingRight: 20)
        mainButton.addTarget(self, action: #selector(handleMainButton), for: .touchUpInside)
        
        
    }
    
    

}

extension ToDoVC: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if notesTextView.text == "Add a note here"{
            notesTextView.text = ""
            notesTextView.tintColor = UIColor.white
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if notesTextView.text == "" || notesTextView.text == nil {
            notesTextView.text = "Add a note here"
            notesTextView.tintColor = UIColor.white
        }
    }
}
