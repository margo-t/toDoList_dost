//
//  TaskCell.swift
//  dost
//
//  Created by Margo T on 2017-02-14.
//  Copyright © 2017 margot. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var notes: UILabel!
    @IBOutlet weak var completedButton: UIButton!
    
    
    @IBAction func completed(_ sender: UIButton) {
        print("completed pressed")
        
        let task: Task!
        task = Task(context: context)
        print(task.title as Any, task.notes as Any)
        //sender.setImage(UIImage(named: "switchOFF"), for: UIControlState.normal)
        
        /*
        var task: Task!
        
        if task.completed {
            task.completed = false
        } else {task.completed = true}
        */

    }
    
    
    func configureCell(task: Task) {
        title.text = task.title
        notes.text = task.notes
        setCompletedStyle(state: task.completed)
        
    }
    
    func setCompletedStyle(state: Bool){
        
        if !state {
            completedButton.setImage(UIImage(named: "switchOFF"), for: UIControlState.normal)
            title?.textColor = UIColor.black
            notes?.textColor = UIColor.black
            //state = true
        } else {
            completedButton.setImage(UIImage(named: "switchON"), for: UIControlState.normal)
            title?.textColor = UIColor.lightGray
            notes?.textColor = UIColor.lightGray
        }
    }

}
