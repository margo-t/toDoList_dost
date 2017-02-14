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
    
    }
    
    //set up table view controller
        func tableView(_ tableView: UITableView, cellForRowAt: IndexPath) -> UITableViewCell {
            
            return UITableViewCell()
        }
        
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 0
        }
        
        func numberOfSections(in: UITableView) -> Int {
        
            return 0
        }
    
    //connect to core data
    func attemptFetch() {
        
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        let dateSort = NSSortDescriptor(key: "created", ascending: false)
        fetchRequest.sortDescriptors = [dateSort]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        do {
            try controller.performFetch()
        
        } catch {
            let error = error as NSError
            print("\(error)")
        
        
        }
        
    
    
    
    
    }
        
    
    
    
    
}

