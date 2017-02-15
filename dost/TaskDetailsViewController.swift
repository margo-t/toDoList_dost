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
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        if let topTask = self.navigationController?.navigationBar.topItem {
            
            topTask.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        
        }
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        
        print("pressed")
        
        let task = Task(context: context)
        
        if let title = titleField.text {
            task.title = title
        }
        
        if let notes = notesField.text {
            task.notes = notes
        }
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
        
        
        
    }
    

    
    

}
