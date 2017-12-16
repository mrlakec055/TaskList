//
//  AddTaskUseCase.swift
//  TaskList
//
//  Created by Исрапил Гусиев on 07.12.17.
//  Copyright © 2017 Israpil Gusiev. All rights reserved.
//

import Foundation

protocol AddTaskUseCase {
    func add(parameters: AddTaskUseCase)
}

struct AddTaskParameters {
    var idTask: Int
    var nameTask: String
    var descriptionTask: String
    var responsibleTask: String
    var directorTask: String
    var projectTask: String
    var directionTask: String
}
