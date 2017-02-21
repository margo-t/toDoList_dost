//
//  Task+CoreDataClass.swift
//  dost
//
//  Created by Margarita Tereshchenkova - ID: 300923592 on 2017-02-13.
//  Copyright © 2017 margot. All rights reserved.
//
// Description: 'Task' entity functions
import Foundation
import CoreData


public class Task: NSManagedObject {
    
    public override func awakeFromInsert() {
        
        super.awakeFromInsert()
        
        self.created = NSDate()
        self.completed = false
    }
}
