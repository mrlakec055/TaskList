//
//  RequestDataTasks.swift
//  TaskList
//
//  Created by Исрапил Гусиев on 09.12.17.
//  Copyright © 2017 Israpil Gusiev. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class RequestDataTasks {
        
    /*
 Тут пытаюсь реализовать сохранение в базу данных, сам не знаю что и куда передавать внутри функции, запутался уже.
     В этот метод будет обращаться AddTaskTableViewModel, после уже AddTaskTableViewPresenter будет обрабатывать сохранение из модели в coredata.
 */
    func requestAddTask(dictionary: [String: AnyObject], complition: @escaping ([String]) -> ()) -> NSManagedObject? {
        let context = CoreDataStackImplementation.sharedInstance.persistentContainer.viewContext
        
        if let task = NSEntityDescription.insertNewObject(forEntityName: "Task", into: context) as? CoreDataTask {
            task.taskName = dictionary["name"] as? String
            task.taskDescription = dictionary["description"] as? String
            task.taskDirection = dictionary["direction"] as? String
            task.taskProject = dictionary["project"] as? String
            task.taskDirector = dictionary["director"] as? String
            task.taskResponsible = dictionary["responsible"] as? String
            do {
                try context.save()
                print("Сохранение в базу данных произошло успешно")
                print("\(String(describing: task.taskName))\(String(describing: task.taskDescription))\(String(describing: task.taskDirection))\(String(describing: task.taskProject))\(String(describing: task.taskResponsible))\(String(describing: task.taskDirector))")
            } catch let error as NSError {
                print("Не удалось сохранить задачу \(error), \(error.userInfo)")
            }
        }
        
        
        return nil
    }
    
    // Этот метод вроде как должен реализовать само сохранение в dictionary, правда сам не совсем понимаю как
    
    func saveInCoreDataWith(array: [[String: AnyObject]]) {
        _ = array.map{self.requestAddTask(dictionary)}
        do {
            try CoreDataStackImplementation.sharedInstance.persistentContainer.viewContext.save()
        } catch let error {
            print(error)
        }
    }
    
}
