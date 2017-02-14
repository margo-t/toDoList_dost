//
//  Task+CoreDataClass.swift
//  dost
//
//  Created by Margo T on 2017-02-13.
//  Copyright © 2017 margot. All rights reserved.
//

import Foundation
import CoreData


public class Task: NSManagedObject {
    
    public override func awakeFromInsert() {
        
        super.awakeFromInsert()
        
        self.created = NSDate()
    }
}
