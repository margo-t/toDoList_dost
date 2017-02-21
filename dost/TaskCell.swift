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
    
    var completedAction: ((UITableViewCell) -> Void)?
    
    func configureCell(task: Task) {
        title.text = task.title
        notes.text = task.notes
        setCompletedStyle(state: task.completed)
        
    }
    
    
    @IBAction func completed(_ sender: UIButton) {
        
        completedAction!(self)
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
    
    func updateCompletion(task: Task) {
        if task.completed {
            task.completed = false
            
        } else {
            task.completed = true
        }
        ad.saveContext()
    }

}
