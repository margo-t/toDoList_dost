//
//  TaskDetailsViewController.swift
//  dost
//
//  Created by Margo T on 2017-02-14.
//  Copyright © 2017 margot. All rights reserved.
//

import UIKit

class TaskDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var titleField: CustomTextField!
    @IBOutlet weak var notesField: CustomTextField!
    
    var taskToEdit: Task?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let topTask = self.navigationController?.navigationBar.topItem {
            
            topTask.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        
        }
        
        if taskToEdit != nil {
            
            loadTaskData()
        }
        
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        
        print("pressed")
        
        var task: Task!
        
        if taskToEdit == nil {
            
            task = Task(context: context)
        }
        else {
            task = taskToEdit
        }
        
        //let task = Task(context: context)
        
        if let title = titleField.text {
            task.title = title
        }
        
        if let notes = notesField.text {
            task.notes = notes
        }
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    func loadTaskData(){
        
        if let task = taskToEdit {
            
            titleField.text = task.title
            notesField.text = task.notes
        
        }
        
    }
    
    @IBAction func delete_pressed(_ sender: Any) {
        
        if taskToEdit != nil {
            
            context.delete(taskToEdit!)
            ad.saveContext()
        }
        
        _ = navigationController?.popViewController(animated: true)
        
    }

    
    

}
