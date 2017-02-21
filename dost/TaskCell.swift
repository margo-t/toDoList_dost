//
//  TaskCell.swift
//  dost
//
//  Created by Margarita Tereshchenkova - ID: 300923592 on 2017-02-14.
//  Copyright © 2017 margot. All rights reserved.
//
//  Description: TaskCell view-related configurations
import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var notes: UILabel!
    @IBOutlet weak var completedButton: UIButton!
    
    var completedAction: ((UITableViewCell) -> Void)?

    
    @IBAction func completed(_ sender: UIButton) {
        completedAction!(self)
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
            title?.font = UIFont.boldSystemFont(ofSize: 20)
            notes?.textColor = UIColor.black
            
        } else {
            completedButton.setImage(UIImage(named: "switchON"), for: UIControlState.normal)
            title?.textColor = UIColor.lightGray
            title?.font = UIFont.italicSystemFont(ofSize: 18)
            notes?.textColor = UIColor.lightGray
        }
    }
    
    func updateCompletion(task: Task) {
        if task.completed {
            task.completed = false
            
        } else {
            task.completed = true
        }
        ad.saveContext()
    }

}
