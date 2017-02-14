//
//  Task+CoreDataProperties.swift
//  dost
//
//  Created by Margo T on 2017-02-13.
//  Copyright © 2017 margot. All rights reserved.
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task");
    }

    @NSManaged public var created: NSDate?
    @NSManaged public var notes: String?
    @NSManaged public var title: String?
    @NSManaged public var completed: Bool
    @NSManaged public var toType: TaskType?

}
