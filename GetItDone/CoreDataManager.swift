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
    
    
    // MARK: Create new Todo
    func createNewTodo(id: String, title: String, status: Bool, useArray entityArray: inout [NSManagedObject]) {
            
        // point to Todo entity
        let entity = NSEntityDescription.entity(forEntityName: EntityName.todo.rawValue, in: managedContext)!
        
        // create new todo
        let todo = NSManagedObject(entity: entity, insertInto: managedContext)
        
        // set todo items
        todo.setValue(id,     forKey: "id")
        todo.setValue(title,  forKey: "title")
        todo.setValue(status, forKey: "status")
        
        do { //Save context and add to array
            try managedContext.save()
            entityArray.append(todo)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    
    // MARK: Get todo list
    func getTodoList(andSaveToArray entityArray: inout [NSManagedObject]) {
        
        // Prepare fetchRequest
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: EntityName.todo.rawValue)
        
        //Get saved data
        do {
            entityArray = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    
    // Update todo item
    
    
    // Delete todo item
    
    
}


// enum to easily access all entity names
// todo is only one... for now
enum EntityName: String {
    case todo = "Todo"
}
