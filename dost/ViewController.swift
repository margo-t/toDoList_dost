//
//  ViewController.swift
//  dost
//
//  Created by Margo T on 2017-02-13.
//  Copyright © 2017 margot. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {


    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segment: UISegmentedControl!
    
    var controller: NSFetchedResultsController<Task>!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //generateTestData()
        attemptFetch()
    
    }
    
    
    //set up table view controller
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskCell
            
            configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
            return cell
        }
    
    func configureCell(cell: TaskCell, indexPath: NSIndexPath) {
        
       let task = controller.object(at: indexPath as IndexPath)
        cell.configureCell(task: task)
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let obj = controller.fetchedObjects , obj.count > 0 {
            
            let task = obj[indexPath.row]
            performSegue(withIdentifier: "TaskDetailsVC", sender: task)
        
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TaskDetailsVC" {
            
            if let destination = segue.destination as? TaskDetailsViewController {
                
                if let task = sender as? Task {
                    destination.taskToEdit = task
                }
            }
        
        }
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if let sections = controller.sections {
                let sectionInfo = sections[section]
                return sectionInfo.numberOfObjects
            }
            
            return 0
        }
        
    func numberOfSections(in: UITableView) -> Int {
        
            if let sections = controller.sections {
                return sections.count
            }

            return 0
        }
    
    
    //change cell style depending on 'completed' attribute
    /*func toggleCellCheckbox(_ cell: UITableViewCell, isCompleted: Bool) {
        if !isCompleted {
            cell.accessoryType = .none
            cell.textLabel?.textColor = UIColor.black
            cell.detailTextLabel?.textColor = UIColor.black
        } else {
            cell.accessoryType = .checkmark
            cell.textLabel?.textColor = UIColor.gray
            cell.detailTextLabel?.textColor = UIColor.gray
        }
    }*/
    
    
    //connect to core data
    func attemptFetch() {
        
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        let dateSort = NSSortDescriptor(key: "created", ascending: false)
        fetchRequest.sortDescriptors = [dateSort]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        controller.delegate = self
        self.controller = controller
        
        do {
            try controller.performFetch()
        
        } catch {
            let error = error as NSError
            print("\(error)")
        }
    }
    
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        tableView.endUpdates()
    }
    
    
    //fetched results controller for displaying data
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
            
        
        case.insert:
            if let indexPath = newIndexPath {
                
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
            
        case.delete:
            if let indexPath = indexPath {
                    
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            break
            
        case.update:
            if let indexPath = indexPath {
                
                let cell = tableView.cellForRow(at: indexPath) as! TaskCell
                configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
            
            }
            break
            
        case.move:
            if let indexPath = indexPath {
                
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            
            if let indexPath = indexPath {
                
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
            
   
        }
    }
        
    func generateTestData() {
        
        let task1 = Task (context: context)
        task1.title = "Finish the iOS Assignment"
        task1.notes = "Complete to do list called 'dost'"
        task1.completed = true
    
        let task2 = Task (context: context)
        task2.title = "Finish the Web Assignment"
        task2.notes = "Implement Calculator with Angular 2"
        task2.completed = false
        
        let task3 = Task (context: context)
        task3.title = "Finish the ET Assignment"
        task3.notes = "udate on twitter feedback with RED node"
        task3.completed = true
        
        ad.saveContext()
    
    }
    
    
    
    /*
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        
        if editingStyle == .delete {
            if let obj = controller.fetchedObjects , obj.count > 0 {
                
                let task = obj[indexPath.row]
                context.delete(task)
                ad.saveContext()
                
            }
            
        }
    }
    
    */


    
    func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]? {
        

        let done = UITableViewRowAction(style: .normal, title: "Done") { action, index in
            print("completed")

        }
        done.backgroundColor = .blue
        
        
        
        let delete = UITableViewRowAction(style: .normal, title: "Delete") { action, index in
            print("delete")
        }
        delete.backgroundColor = .red
        
        return [delete, done]
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    
    /*
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            // delete item at indexPath
        }
        
        let share = UITableViewRowAction(style: .normal, title: "Disable") { (action, indexPath) in
            // share item at indexPath
        }
        
        share.backgroundColor = UIColor.blue
        
        return [delete, share]
    }*/
    
    
}





