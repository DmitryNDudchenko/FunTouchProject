//
//  Messages+CoreDataClass.swift
//  FunTouch
//
//  Created by Dmitry Dudchenko on 24.03.2023.
//
//

import Foundation
import CoreData


public class Messages: NSManagedObject {
    convenience init() {
        self.init(entity: managerCoreData.instance.entityForName(entityName: "Messages"), insertInto: managerCoreData.instance.context)
    }
}
