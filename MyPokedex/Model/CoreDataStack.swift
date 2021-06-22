//
//  CoreDataStack.swift
//  MyPokedex
//
//  Created by Madison Shino on 6/17/21.
//  Copyright © 2021 Madi S. All rights reserved.
//

import Foundation
import CoreData

enum CoreDataStack {
    
    static let container: NSPersistentContainer = {
        
        let coreDataModelName = "Poke"
        let container = NSPersistentContainer(name: coreDataModelName)
        container.loadPersistentStores() { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    static var managedObjectContext: NSManagedObjectContext { return container.viewContext }
}
