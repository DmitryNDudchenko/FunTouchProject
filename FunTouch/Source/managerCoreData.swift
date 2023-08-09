//
//  managerCoreData.swift
//  FunTouch
//
//  Created by Дмитрий on 14.03.2023.
//

import Foundation
import CoreData

class managerCoreData {

    static let instance = managerCoreData()

    private init(){}

    lazy var context: NSManagedObjectContext = {
        persistentContainer.viewContext
    }()

    func entityForName(entityName: String) -> NSEntityDescription {
        return NSEntityDescription.entity(forEntityName: entityName, in: context)!
    }
    

    //MARK: - Core Data stack

    // load inform from Core Dara
    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "FunTouch")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("\(error),\(error.userInfo)")
            }
        })
        return container
    }()

    //MARK: - Core Data Saving

    func saveContext(){
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do{
                try context.save()
            }catch{
                let nserror = error as NSError
                fatalError("\(nserror), \(nserror.userInfo)")
            }
        }
    }

}
