//
//  ViewController.swift
//  Apiproject
//
//  Created by Elnoby on 3/29/20.
//  Copyright © 2020 elnoubi. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var todoItemTxt: UITextField!
    @IBOutlet weak var prioritySegment: UISegmentedControl!
    @IBOutlet weak var todoTable: UITableView!
    
    var todos = Array<Todo>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoTable.delegate = self
        todoTable.dataSource = self
        
        getTodos()
        
        
    }
    
    func getTodos() {
        NetworkService.share.getTodos(onSuccess: { (todos) in
            self.todos = todos.items
            self.todoTable.reloadData()
        }) { (errorMessage) in
            //show alert to user
            debugPrint(errorMessage)
        }
    }
    
    @IBAction func addTodo(_ sender: Any) {
        guard let todoItem = todoItemTxt.text else {
            //show error "you must enter a todo item"
            return
        }
        
        let todo = Todo(item: todoItem, priority: prioritySegment.selectedSegmentIndex)
        NetworkService.share.addTodo(todo: todo, onSuccess: { (todos) in
            self.todoItemTxt.text = ""
            self.todos = todos.items
            self.todoTable.reloadData()
        }) { (errorMessage) in
            //show any errors to user on POST
            debugPrint(errorMessage)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "todocell") as? todoCell {
            cell.updateCell(Todo: todos[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    
}

