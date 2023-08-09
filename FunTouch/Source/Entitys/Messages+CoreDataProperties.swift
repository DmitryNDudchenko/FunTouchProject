//
//  Messages+CoreDataProperties.swift
//  FunTouch
//
//  Created by Dmitry Dudchenko on 24.03.2023.
//
//

import Foundation
import CoreData


extension Messages {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Messages> {
        return NSFetchRequest<Messages>(entityName: "Messages")
    }

    @NSManaged public var date: String?
    @NSManaged public var message: String?

}

extension Messages : Identifiable {

}
