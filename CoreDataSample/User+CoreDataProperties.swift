//
//  User+CoreDataProperties.swift
//  CoreDataSample
//
//  Created by Murali Yarramsetti on 08/08/20.
//  Copyright © 2020 Murali Yarramsetti. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var email: String?

}
