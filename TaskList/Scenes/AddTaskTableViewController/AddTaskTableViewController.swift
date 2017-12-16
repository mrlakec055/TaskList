//
//  AddTaskTableViewController.swift
//  TaskList
//
//  Created by Исрапил Гусиев on 06.12.17.
//  Copyright © 2017 Israpil Gusiev. All rights reserved.
//

import UIKit

protocol AddTaskTableViewProtocol {
    //    func didRecieveDataUpdate (nameText: String, descriptionText: String, directionText: String, projectText: String, responsibleText: String, directorText: String)
    func taskText() -> Array<Any>
    func fillLines() -> Bool
}

class AddTaskTableViewController: UITableViewController {
    
    var presenter: AddTaskPresenter?
    
    var allLinesFill = false
    var responsible = ["Human1", "Human2", "Human3"]
    var director = ["Director1", "Director2", "Director3"]
    var project = ["Project1", "Project2", "Project3"]
    var direction = ["iOS", "Web", "Android"]
    
    //MARK:  - IBOutlets - 
    //MARK: Button
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    //MARK: - TextField
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var directionTextField: UITextField!
    @IBOutlet weak var projectTextField: UITextField!
    @IBOutlet weak var responsibleTextField: UITextField!
    @IBOutlet weak var directorTextField: UITextField!
    
    //MARK:  - PickerView
    var responsiblePickerView = UIPickerView()
    var directorPickerView = UIPickerView()
    var projectPickerView = UIPickerView()
    var directionPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = AddTaskPresenterImplementation(viewProtocol: self)
        pickerViewSetup(pickerView: responsiblePickerView, inputInTextField: responsibleTextField, tag: 0)
        pickerViewSetup(pickerView: directorPickerView, inputInTextField: directorTextField, tag: 1)
        pickerViewSetup(pickerView: projectPickerView, inputInTextField: projectTextField, tag: 2)
        pickerViewSetup(pickerView: directionPickerView, inputInTextField: directionTextField, tag: 3)
    }
    
    //MARK: - IBActions -
    //MARK: Button
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        presenter?.saveButtonPressed(view: self)
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        presenter?.saveButtonPressed(view: self)
    }
    
    func pickerViewSetup(pickerView: UIPickerView, inputInTextField: UITextField, tag: Int) {
        pickerView.delegate = self
        pickerView.dataSource = self
        inputInTextField.inputView = pickerView
        pickerView.tag = tag
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }
    
}

extension AddTaskTableViewController: AddTaskTableViewProtocol {
    
    func fillLines() -> Bool {
        if nameTextField.text == "" || descriptionTextField.text == "" || directionTextField.text == "" || projectTextField.text == "" || responsibleTextField.text == "" || directorTextField.text == "" {
            allLinesFill = false
        } else {
            allLinesFill = true
        }
        return allLinesFill
    }
    
    func taskText() -> Array<Any> {
        var taskEntity = [String]()

        let name = nameTextField.text
        let description = descriptionTextField.text
        let direction = directionTextField.text
        let project = projectTextField.text
        let responsible = responsibleTextField.text
        let director = directorTextField.text

        taskEntity.append(name!)
        taskEntity.append(description!)
        taskEntity.append(direction!)
        taskEntity.append(project!)
        taskEntity.append(responsible!)
        taskEntity.append(director!)

        return taskEntity

    }
    
}

// MARK: - Picker view data source

extension AddTaskTableViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView.tag == 0) {
            return responsible.count
        } else if (pickerView.tag == 1) {
            return director.count
        } else if (pickerView.tag == 2) {
            return project.count
        } else {
            return direction.count
        }
    }
}

// MARK: Picker view delegate

extension AddTaskTableViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView.tag == 0) {
            responsibleTextField.text = responsible[row]
            self.view.endEditing(false)
        } else if (pickerView.tag == 1) {
            directorTextField.text = director[row]
            self.view.endEditing(false)
        } else if (pickerView.tag == 2 ) {
            projectTextField.text = project[row]
            self.view.endEditing(false)
        } else {
            directionTextField.text = direction[row]
            self.view.endEditing(false)
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView.tag == 0) {
            return responsible[row]
        } else if (pickerView.tag == 1) {
            return director[row]
        } else if (pickerView.tag == 2) {
            return project[row]
        } else {
            return direction[row]
        }
        
    }
}
