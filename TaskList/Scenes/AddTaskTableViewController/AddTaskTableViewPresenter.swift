//
//  AddTaskTableViewPresenter.swift
//  TaskList
//
//  Created by Исрапил Гусиев on 06.12.17.
//  Copyright © 2017 Israpil Gusiev. All rights reserved.
//

import Foundation
import UIKit
import CoreData

protocol AddTaskPresenter {
    func saveButtonPressed(view: UIViewController)
    func cancelButtonPressed(view: UIViewController)
}


class AddTaskPresenterImplementation: AddTaskPresenter {
    
    var viewProtocol: AddTaskTableViewProtocol
    
    
    init(viewProtocol: AddTaskTableViewProtocol) {
        self.viewProtocol = viewProtocol
    }
    
    
    // В данный момент сохраняю вот таким вот методом, Тут все работает.
    func saveButtonPressed(view: UIViewController) {
        if viewProtocol.fillLines() {
            let context = CoreDataStackImplementation.sharedInstance.persistentContainer.viewContext
            let task = CoreDataTask(context: context)
            task.taskName = viewProtocol.taskText()[0] as? String
            task.taskDescription = viewProtocol.taskText()[1] as? String
            task.taskDirection = viewProtocol.taskText()[2] as? String
            task.taskProject = viewProtocol.taskText()[3] as? String
            task.taskResponsible = viewProtocol.taskText()[4] as? String
            task.taskDirector = viewProtocol.taskText()[5] as? String
            do {
                try context.save()
                print("Сохранение в базу данных произошло успешно")
                print("\(String(describing: task.taskName))\(String(describing: task.taskDescription))\(String(describing: task.taskDirection))\(String(describing: task.taskProject))\(String(describing: task.taskResponsible))\(String(describing: task.taskDirector))")
            } catch let error as NSError {
                print("Не удалось сохранить задачу \(error), \(error.userInfo)")
            }
        }
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let initialVC = sb.instantiateViewController(withIdentifier: "TaskTVC")
        view.navigationController?.pushViewController(initialVC, animated: true)
    }
    
    
    func cancelButtonPressed(view: UIViewController) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let initialVC = sb.instantiateViewController(withIdentifier: "TaskTVC")
        view.navigationController?.pushViewController(initialVC, animated: true)
    }
    
    
}
