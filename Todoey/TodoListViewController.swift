//
//  ViewController.swift
//  Todoey
//
//  Created by James Lee on 9/6/18.
//  Copyright © 2018 James Lee. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    // let itemArray = ["Find Mike","Buy Eggos","Destroy Demogoron"]
    // Change above line from immutable(Constant) to variable mutable by using var
       var itemArray = ["Find Mike","Buy Eggos","Destroy Demogoron"]
    
    let defaults = UserDefaults.standard
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let items = defaults.array(forKey: "ToDoListArray") as? [String] {
            
            itemArray = items
        }
       
        // Do any additional setup after loading the view, typically from a nib.
    }
    
        //Mark - TableView DataSource Method
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
        
    }
    
    //Mark - TableView Delegate Method
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
        
        if
            tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
         }  else {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            
         }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
    //Mark Add New Items
    
    @IBAction func AddButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add a New To Do list", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) {
            
            (action) in
             //What will happen once the user clicks add item button on our UIAlert
            // print("Success: \(textField.text!)")
            
            self.itemArray.append(textField.text!)
            self.defaults.setValue(self.itemArray, forKey: "ToDoListArray")
            self.tableView.reloadData()
            
             }
        
        
        alert.addTextField {
            
            (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
            print(alertTextField.text!)
            
        }
        
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        }
    
    
    
}

