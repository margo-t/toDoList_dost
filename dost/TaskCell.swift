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
    
    
    func configureCell(task: Task) {
        title.text = task.title
        notes.text = task.notes
        
        
    }

}
