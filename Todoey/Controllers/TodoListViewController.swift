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
       var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
        
        
        let newItem2 = Item()
        newItem2.title = "Bug Eggos"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Destroy Demogoron"
        itemArray.append(newItem3)
        
        
        
        
        
       if let items = defaults.array(forKey: "ToDoListArray") as? [Item] {
            
          itemArray = items
        
     }
       
        // Do any additional setup after loading the view, typically from a nib.
    }
    
        //Mark - TableView DataSource Method
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       // print("cellForRowAtIndexPath called")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        // You can replace below code with turnary operator
        
        /* if item.done == true {
            
            cell.accessoryType = .checkmark
            
        }  else {
            
            cell.accessoryType = .none
        } */
        
        
        // Turnary Operator ---> value = condition ? valueTrue: ValueFalse.
        // IIF () function in MS Access
        
        // cell.accessoryType = item.done == true ? .checkmark:.none  Or short form below
        
        cell.accessoryType = item.done ? .checkmark:.none
        
        return cell
        
    }
    
    //Mark - TableView Delegate Method
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //print(itemArray[indexPath.row])
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
     /*   if itemArray[indexPath.row].done == false {
            
            itemArray[indexPath.row].done = true
            
        }   else {
            
            itemArray[indexPath.row].done = false
            
        }
     */
        
        
     /*   if
            tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
         }  else {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            
         }
 
    */
        
        tableView.reloadData()
        
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
            
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
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

