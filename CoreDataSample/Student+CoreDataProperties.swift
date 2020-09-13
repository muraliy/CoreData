//
//  Student+CoreDataProperties.swift
//  CoreDataSample
//
//  Created by Murali Yarramsetti on 08/08/20.
//  Copyright © 2020 Murali Yarramsetti. All rights reserved.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var roolnumber: Int64

}
