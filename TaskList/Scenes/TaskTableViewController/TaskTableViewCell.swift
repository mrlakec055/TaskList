//
//  TaskTableViewCell.swift
//  TaskList
//
//  Created by Исрапил Гусиев on 06.12.17.
//  Copyright © 2017 Israpil Gusiev. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var taskProjectLabel: UILabel!
    @IBOutlet weak var taskDirectionLabel: UILabel!
    @IBOutlet weak var taskNameLabel: UILabel!
    
//    var taskItem: CoreDataStack? {
//        didSet {
//            taskProjectLabel.text = taskItem?.taskProject
//            taskDirectionLabel.text = taskItem?.taskDirection
//            taskNameLabel.text = taskItem?.taskName
//        }
//    }
}
