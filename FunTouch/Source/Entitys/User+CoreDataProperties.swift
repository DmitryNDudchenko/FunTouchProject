//
//  User+CoreDataProperties.swift
//  FunTouch
//
//  Created by Dmitry Dudchenko on 24.03.2023.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var age: Int16
    @NSManaged public var female: String?
    @NSManaged public var name: String?

}

extension User : Identifiable {

}
