//
//  Emoji+CoreDataProperties.swift
//  FunTouch
//
//  Created by Dmitry Dudchenko on 24.03.2023.
//
//

import Foundation
import CoreData


extension Emoji {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Emoji> {
        return NSFetchRequest<Emoji>(entityName: "Emoji")
    }

    @NSManaged public var descr: String?
    @NSManaged public var name: String?
    @NSManaged public var symbol: String?
    @NSManaged public var usage: String?

}

extension Emoji : Identifiable {

}
