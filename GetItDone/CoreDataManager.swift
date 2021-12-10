//
//  CoreDataManager.swift
//  GetItDone
//
//  Created by Alberto Dominguez on 11/24/21.
//

import CoreData
import Foundation
import UIKit

// inspired by https://codereview.stackexchange.com/questions/220783/core-data-wrapper

struct CoreDataManager {
    
    static let shared = CoreDataManager()
    
    let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    // MARK: - Create new Todo
    func createNewTodo(title: String, status: Bool, notes: String = "") {
        
        let todoItem = ToDo(context: managedContext)
        todoItem.title = title
        todoItem.status = status
        todoItem.notes = notes
        
        do { //Save context and add to array
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    
    // MARK: - Get todo list
    func getTodoList(andSaveToArray entityArray: inout [ToDo]) {
        
        // Prepare fetchRequest
        let fetchRequest = ToDo.fetchRequest()
                
        //Get saved data
        do {
            try managedContext.fetch(fetchRequest)
            entityArray = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    
    // MARK: - Update todo
    func toggleTodoItem(_ todo: ToDo) {
        todo.status.toggle()
        do {
            try managedContext.save()
        }
        catch {}
    }
    
    // MARK: - Delete todo
    func deleteTodoItem(_ todo: ToDo) {
        do {            
            try managedContext.delete(todo)
            
            try managedContext.save()
        } catch let error as NSError {
            print("Could not delete. \(error), \(error.userInfo)")
        }
    }
    
}


// enum to easily access all entity names
// todo is only one... for now
enum EntityName: String {
    case todo = "Todo"
}
