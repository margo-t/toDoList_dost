//
//  TaskType+CoreDataProperties.swift
//  dost
//
//  Created by Margo T on 2017-02-13.
//  Copyright © 2017 margot. All rights reserved.
//

import Foundation
import CoreData


extension TaskType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskType> {
        return NSFetchRequest<TaskType>(entityName: "TaskType");
    }

    @NSManaged public var type: String?
    @NSManaged public var toTask: Task?

}
