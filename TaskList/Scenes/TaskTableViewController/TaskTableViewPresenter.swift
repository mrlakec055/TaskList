//
//  TaskTableViewPresenter.swift
//  TaskList
//
//  Created by Исрапил Гусиев on 06.12.17.
//  Copyright © 2017 Israpil Gusiev. All rights reserved.
//

import Foundation
import UIKit
import CoreData

protocol TasksPresenter {
    func addButtonPressed(view: UIViewController)
    func displayTasks()
    
}

class TasksPresenterImplementation: TasksPresenter {
    
    var fetchResultsController: NSFetchedResultsController<CoreDataTask>!
    
    var tasks = [CoreDataTask]()
    
    func displayTasks() {
        let context = CoreDataStackImplementation.sharedInstance.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "CoreDataTask")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "taskName") as! String)
            }
            
        } catch {
            
            print("Failed")
        }
//
//        let fetchRequest: NSFetchRequest<CoreDataTask> = CoreDataTask.fetchRequest()
//        let sortDescriptor = NSSortDescriptor(key: "taskName", ascending: true)
//        fetchRequest.sortDescriptors = [sortDescriptor]
//
//        if let context = (UIApplication.shared.delegate as? AppDelegate)?.coreDataStack.persistentContainer.viewContext {
//            fetchResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
//
//            do {
//                try fetchResultsController.performFetch()
//                tasks = fetchResultsController.fetchedObjects!
//            } catch let error as NSError {
//                print("Получить данные не удалось\(error)")
//            }
//        }
        
    }
    
    
    func addButtonPressed(view: UIViewController) {

        let sb = UIStoryboard(name: "Main", bundle: nil)
        let initialVC = sb.instantiateViewController(withIdentifier: "AddTaskVC")
        view.navigationController?.pushViewController(initialVC, animated: true)
    }
    
    
}
